//
//  UIView+XExplode.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/10.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIView+XExplode.h"
#import "UIImage+MoneySaver.h"
#import "NSTimer+MSSubmitTransition.h"
#import <objc/runtime.h>

static char const * const kBoomCellsProperty     = "BoomCellsProperty";
static char const * const kScaleSnapshotProperty = "ScaleSnapshotProperty";


static NSString *kBoomCellsName       = @"BoomCells";
static NSString *kScaleSnapshotName   = @"BoomScaleSnapshot";

static NSString *kScaleAnimationKey   = @"scaleAnimation";
static NSString *kOpacityAnimationKey = @"opacityAnimation";
static NSString *kMoveAnimationKey    = @"moveAnimation";

#define kBoomAnimateCompleteBlockKey @"BoomAnimateCompleteBlockKey"

@implementation UIView (XExplode)


#pragma mark - Public Method
- (UIImage *)snapshot
{
    UIGraphicsBeginImageContext(self.layer.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)boomAnimate:(void (^) (CFRunLoopTimerRef timer))animateComplete;
{
    CAKeyframeAnimation *shakeXAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    shakeXAnimation.duration = 0.2;
    shakeXAnimation.values = @[@([self makeShakeValue:self.layer.position.x]),
                               @([self makeShakeValue:self.layer.position.x]),
                               @([self makeShakeValue:self.layer.position.x]),
                               @([self makeShakeValue:self.layer.position.x])];

    
    CAKeyframeAnimation *shakeYAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    shakeYAnimation.duration = shakeXAnimation.duration;
    shakeYAnimation.values =@[@([self makeShakeValue:self.layer.position.y]),
                              @([self makeShakeValue:self.layer.position.y]),
                              @([self makeShakeValue:self.layer.position.y]),
                              @([self makeShakeValue:self.layer.position.y])];
    

    [self.layer addAnimation:shakeXAnimation forKey:@"shakeXAnimation"];
    [self.layer addAnimation:shakeYAnimation forKey:@"shakeYAnimation"];

    [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(scaleOpacityAnimations) userInfo:nil repeats:NO];
    
    if (self.boomCells.count == 0){
        for (NSInteger i = 0; i <16; i ++) {
            for (NSInteger j = 0; j <16; j ++) {
                if (self.scaleSnapshot == nil) {
                    self.scaleSnapshot = [[self snapshot] scaleImageToSize:CGSizeMake(34, 34)];
                }

                CGFloat pWidth = MIN(self.frame.size.width,self.frame.size.height)/17;
                UIColor *color = [self.scaleSnapshot getPixelColorAtLocation:CGPointMake(i*2, j*2)];

                CALayer *shape = [CALayer layer];
                shape.backgroundColor = color.CGColor;
                shape.opacity = 0;
                shape.cornerRadius = pWidth/2;
                shape.frame = CGRectMake(i * pWidth, j * pWidth, pWidth, pWidth);
                [self.layer.superlayer addSublayer:shape];
                [self.boomCells addObject:shape];
            }
        }
    }
    NSDictionary *userInfo = nil;
    if (animateComplete) {
        userInfo = @{kBoomAnimateCompleteBlockKey:animateComplete};
    }
    [NSTimer scheduledTimerWithTimeInterval:0.35 target:self selector:@selector(cellAnimations:) userInfo:userInfo repeats:NO];
}

- (void)resetBoomAnimateState
{
    self.layer.opacity = 1;
}


#pragma mark - Public Method

#pragma mark  Animate
- (void)scaleOpacityAnimations
{
    //缩放
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.toValue = @(0.01f);
    scaleAnimation.duration = 0.15f;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = YES;
    
    //透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    opacityAnimation.duration = 0.15;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.removedOnCompletion = YES;
    
    [self.layer addAnimation:scaleAnimation forKey:kScaleAnimationKey];
    [self.layer addAnimation:opacityAnimation forKey:kOpacityAnimationKey];
    self.layer.opacity = 0;

}

- (void)cellAnimations:(NSTimer *)timer
{
    NSTimeInterval maxDuration = 0;
    for(CALayer *shape in self.boomCells){
        shape.position = self.center;
        shape.opacity = 1;
        //路径
        CAKeyframeAnimation *moveAnimation =[CAKeyframeAnimation animationWithKeyPath:@"position"];
        moveAnimation.path = [self makeRandomPath:shape].CGPath;
        moveAnimation.removedOnCompletion = NO;
        moveAnimation.fillMode = kCAFillModeForwards;

        moveAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.24 :0.59 :0.506667 :0.026667];
        moveAnimation.duration = random()%10 * 0.05 + 0.3;
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.toValue = @([self makeScaleValue]);
        scaleAnimation.duration = moveAnimation.duration;
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @1;
        opacityAnimation.toValue = @0;
        opacityAnimation.duration = moveAnimation.duration;
        opacityAnimation.delegate = self;
        opacityAnimation.removedOnCompletion = YES;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.380000 :0.033333 :0.963333 :0.260000];

        
        shape.opacity = 0;
        maxDuration = MAX(maxDuration, moveAnimation.duration);
        [shape addAnimation:scaleAnimation forKey:kScaleAnimationKey];
        [shape addAnimation:moveAnimation forKey:kMoveAnimationKey];
        [shape addAnimation:opacityAnimation forKey:kOpacityAnimationKey];
    }
    void (^animateComplete)(CFRunLoopTimerRef timer) = [timer.userInfo objectForKey:kBoomAnimateCompleteBlockKey];
    if (animateComplete) {
        [NSTimer scheduleDelay:maxDuration handle:animateComplete];
    }
}

- (void)removeBoomCells
{
    if (self.boomCells) {
        for (CALayer *layer in self.boomCells) {
            [layer removeFromSuperlayer];
        }
        [self.boomCells removeAllObjects];
        self.boomCells = nil;
    }

}

#pragma mark Animate Maker
- (UIBezierPath *)makeRandomPath:(CALayer *)aLayer
{
    UIBezierPath *particlePath = [UIBezierPath bezierPath];
    [particlePath moveToPoint:self.layer.position];
    CGFloat basicLeft = -(1.3 * self.layer.frame.size.width);
    CGFloat maxOffset = 2 * fabs(basicLeft);
    CGFloat randomNumber = random()%101;
    CGFloat endPointX = basicLeft + maxOffset * (randomNumber/100) + aLayer.position.x;
    CGFloat controlPointOffSetX = (endPointX - aLayer.position.x)/2  + aLayer.position.x;
    CGFloat controlPointOffSetY = self.layer.position.y - 0.2 * self.layer.frame.size.height - random()%(NSInteger)(1.2 * self.layer.frame.size.height);
    CGFloat endPointY = self.layer.position.y + self.layer.frame.size.height/2 + random()%(NSInteger)(self.layer.frame.size.height/2);
    [particlePath addQuadCurveToPoint:CGPointMake(endPointX, endPointY) controlPoint:CGPointMake(controlPointOffSetX, controlPointOffSetY)];
    return particlePath;
}


- (CGFloat)makeScaleValue
{
    return 1 - 0.7 * (random()%101 - 50)/50.0;
}

- (CGFloat)makeShakeValue:(CGFloat)p
{
    CGFloat basicOrigin = -10;
    CGFloat maxOffset = -2 * basicOrigin;
    return basicOrigin + maxOffset * (random()%101)/(100.0) + p;
}

- (UIColor *)colorWithPoint:(CGPoint)point image:(UIImage *)image
{
    CFDataRef data = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage));
    UInt8 *pixelData = (UInt8 *)CFDataGetBytePtr(data);

    NSInteger pixelInfo = ((image.size.width * point.y) + point.x) * 4;
    
    CGFloat a = pixelData[pixelInfo] / 255.0;
    CGFloat r = pixelData[pixelInfo+1] / 255.0;
    CGFloat g = pixelData[pixelInfo+2] / 255.0;
    CGFloat b = pixelData[pixelInfo+3] / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

#pragma mark - Getter
- (NSMutableArray *)boomCells
{
    NSMutableArray *arry = objc_getAssociatedObject(self, kBoomCellsProperty);
    if (arry == nil) {
        arry = [NSMutableArray new];
        [self setBoomCells:arry];
    }
    return arry;
}

- (UIImage *)scaleSnapshot
{
    UIImage *image = objc_getAssociatedObject(self, kScaleSnapshotProperty);
    if (image == nil) {
        image = [self snapshot];
        self.scaleSnapshot = image;
    }
    return image;
}

#pragma mark - Setter
- (void)setBoomCells:(NSArray *)boomCells
{
    objc_setAssociatedObject(self, kBoomCellsProperty, boomCells , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setScaleSnapshot:(UIImage *)scaleSnapshot
{
    objc_setAssociatedObject(self, kScaleSnapshotProperty, scaleSnapshot , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
