//
//  MoneySaverIconAnimate.m
//  MoneySaver
//
//  Created by Tbxark on 9/10/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MoneySaverIconAnimate.h"
#import "QCMethod.h"

@interface MoneySaverIconAnimate ()

@property (nonatomic, assign) BOOL  updateLayerValueForCompletedAnimation;
@property (nonatomic, strong) NSMapTable * completionBlocks;
@property (nonatomic, strong) NSMutableDictionary * layers;

@end

@implementation MoneySaverIconAnimate

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupProperties];
        [self setupLayers];
    }
    return self;
}



- (void)setupProperties{
    self.completionBlocks = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsOpaqueMemory valueOptions:NSPointerFunctionsStrongMemory];;
    self.layers = [NSMutableDictionary dictionary];
    
}

- (void)setupLayers{
    CALayer * Background = [CALayer layer];
    Background.frame = CGRectMake(0, 0, 100, 100);
    [self.layer addSublayer:Background];
    self.layers[@"Background"] = Background;
    {
        CAShapeLayer * mainBackground = [CAShapeLayer layer];
        mainBackground.frame = CGRectMake(0, 0, 100, 100);
        mainBackground.path = [self mainBackgroundPath].CGPath;
        [Background addSublayer:mainBackground];
        self.layers[@"mainBackground"] = mainBackground;
        CAShapeLayer * shawdow = [CAShapeLayer layer];
        shawdow.frame = CGRectMake(10, 54, 80, 8);
        shawdow.path = [self shawdowPath].CGPath;
        [Background addSublayer:shawdow];
        self.layers[@"shawdow"] = shawdow;
    }
    
    
    CALayer * Cion = [CALayer layer];
    Cion.frame = CGRectMake(21, 11, 58, 58);
    [self.layer addSublayer:Cion];
    self.layers[@"Cion"] = Cion;
    {
        CAShapeLayer * circle = [CAShapeLayer layer];
        circle.frame = CGRectMake(0, -0, 58, 58);
        circle.path = [self circlePath].CGPath;
        [Cion addSublayer:circle];
        self.layers[@"circle"] = circle;
        CAShapeLayer * text = [CAShapeLayer layer];
        text.frame = CGRectMake(17.4, 9, 23.2, 40);
        text.path = [self textPath].CGPath;
        [Cion addSublayer:text];
        self.layers[@"text"] = text;
    }
    
    
    CAShapeLayer * maskCionView = [CAShapeLayer layer];
    maskCionView.frame = CGRectMake(20, 62, 60, 38);
    maskCionView.path = [self maskCionViewPath].CGPath;
    [self.layer addSublayer:maskCionView];
    self.layers[@"maskCionView"] = maskCionView;
    
    CAShapeLayer * backgroundMask = [CAShapeLayer layer];
    backgroundMask.frame = CGRectMake(0, 100, 100, 30);
    backgroundMask.path = [self backgroundMaskPath].CGPath;
    [self.layer addSublayer:backgroundMask];
    self.layers[@"backgroundMask"] = backgroundMask;
    
    CATextLayer * moneySaverText = [CATextLayer layer];
    moneySaverText.frame = CGRectMake(10, 107.5, 80, 15);
    [self.layer addSublayer:moneySaverText];
    self.layers[@"moneySaverText"] = moneySaverText;
    
    CAShapeLayer * plusSharrp = [CAShapeLayer layer];
    plusSharrp.frame = CGRectMake(88, 106, 8, 8);
    plusSharrp.path = [self plusSharrpPath].CGPath;
    [self.layer addSublayer:plusSharrp];
    self.layers[@"plusSharrp"] = plusSharrp;
    
    [self resetLayerPropertiesForLayerIdentifiers:nil];
}

- (void)resetLayerPropertiesForLayerIdentifiers:(NSArray *)layerIds{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    if(!layerIds || [layerIds containsObject:@"mainBackground"]){
        CAShapeLayer * mainBackground = self.layers[@"mainBackground"];
        mainBackground.fillColor = [UIColor colorWithRed:0.365 green: 0.769 blue:0.467 alpha:1].CGColor;
        mainBackground.lineWidth = 0;
    }
    if(!layerIds || [layerIds containsObject:@"shawdow"]){
        CAShapeLayer * shawdow = self.layers[@"shawdow"];
        shawdow.fillColor = [UIColor colorWithRed:0.125 green: 0.318 blue:0.208 alpha:1].CGColor;
        shawdow.lineWidth = 0;
    }
    if(!layerIds || [layerIds containsObject:@"circle"]){
        CAShapeLayer * circle = self.layers[@"circle"];
        circle.fillColor   = [UIColor colorWithRed:1 green: 0.824 blue:0.4 alpha:1].CGColor;
        circle.strokeColor = [UIColor colorWithRed:0.996 green: 0.737 blue:0.376 alpha:1].CGColor;
        circle.lineWidth   = 2;
    }
    if(!layerIds || [layerIds containsObject:@"text"]){
        CAShapeLayer * text = self.layers[@"text"];
        text.fillColor = [UIColor colorWithRed:0.996 green: 0.737 blue:0.376 alpha:1].CGColor;
        text.lineWidth = 0;
    }
    if(!layerIds || [layerIds containsObject:@"maskCionView"]){
        CAShapeLayer * maskCionView = self.layers[@"maskCionView"];
        maskCionView.fillColor = [UIColor colorWithRed:0.365 green: 0.769 blue:0.467 alpha:1].CGColor;
        maskCionView.lineWidth = 0;
    }
    if(!layerIds || [layerIds containsObject:@"backgroundMask"]){
        CAShapeLayer * backgroundMask = self.layers[@"backgroundMask"];
        backgroundMask.fillColor = [UIColor whiteColor].CGColor;
        backgroundMask.lineWidth = 0;
    }
    if(!layerIds || [layerIds containsObject:@"moneySaverText"]){
        CATextLayer * moneySaverText = self.layers[@"moneySaverText"];
        moneySaverText.contentsScale   = [[UIScreen mainScreen] scale];
        moneySaverText.string          = @"MoneySaver";
        moneySaverText.font            = (__bridge CFTypeRef)@"Helvetica";
        moneySaverText.fontSize        = 13;
        moneySaverText.alignmentMode   = kCAAlignmentCenter;
        moneySaverText.foregroundColor = [UIColor colorWithRed:0.25 green: 0.25 blue:0.25 alpha:1].CGColor;
    }
    if(!layerIds || [layerIds containsObject:@"plusSharrp"]){
        CAShapeLayer * plusSharrp = self.layers[@"plusSharrp"];
        plusSharrp.fillColor = [UIColor colorWithRed:0.125 green: 0.318 blue:0.208 alpha:1].CGColor;
        plusSharrp.lineWidth = 0;
    }
    
    [CATransaction commit];
}

#pragma mark - Animation Setup

- (void)addMoneyDropAnimation{
    [self addMoneyDropAnimationCompletionBlock:nil];
}

- (void)addMoneyDropAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock{
    if (completionBlock){
        CABasicAnimation * completionAnim = [CABasicAnimation animationWithKeyPath:@"completionAnim"];;
        completionAnim.duration = 0.5;
        completionAnim.delegate = self;
        [completionAnim setValue:@"MoneyDrop" forKey:@"animId"];
        [completionAnim setValue:@(NO) forKey:@"needEndAnim"];
        [self.layer addAnimation:completionAnim forKey:@"MoneyDrop"];
        [self.completionBlocks setObject:completionBlock forKey:[self.layer animationForKey:@"MoneyDrop"]];
    }
    
    NSString * fillMode = kCAFillModeForwards;
    
    ////Cion animation
    CAKeyframeAnimation * CionPositionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CionPositionAnim.values                = @[[NSValue valueWithCGPoint:CGPointMake(50, 46)], [NSValue valueWithCGPoint:CGPointMake(50, 100)]];
    CionPositionAnim.keyTimes              = @[@0, @1];
    CionPositionAnim.duration              = 0.5;
    
    CAAnimationGroup * CionMoneyDropAnim = [QCMethod groupAnimations:@[CionPositionAnim] fillMode:fillMode];
    [self.layers[@"Cion"] addAnimation:CionMoneyDropAnim forKey:@"CionMoneyDropAnim"];
    
    ////PlusSharrp animation
    CAKeyframeAnimation * plusSharrpTransformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    plusSharrpTransformAnim.values   = @[@(0),
                                         @(-360 * M_PI/180)];
    plusSharrpTransformAnim.keyTimes = @[@0, @1];
    plusSharrpTransformAnim.duration = 0.5;
    
    CAAnimationGroup * plusSharrpMoneyDropAnim = [QCMethod groupAnimations:@[plusSharrpTransformAnim] fillMode:fillMode];
    [self.layers[@"plusSharrp"] addAnimation:plusSharrpMoneyDropAnim forKey:@"plusSharrpMoneyDropAnim"];
}

#pragma mark - Animation Cleanup

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    void (^completionBlock)(BOOL) = [self.completionBlocks objectForKey:anim];;
    if (completionBlock){
        [self.completionBlocks removeObjectForKey:anim];
        if ((flag && self.updateLayerValueForCompletedAnimation) || [[anim valueForKey:@"needEndAnim"] boolValue]){
            [self updateLayerValuesForAnimationId:[anim valueForKey:@"animId"]];
            [self removeAnimationsForAnimationId:[anim valueForKey:@"animId"]];
        }
        completionBlock(flag);
    }
}

- (void)updateLayerValuesForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"MoneyDrop"]){
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"Cion"] animationForKey:@"CionMoneyDropAnim"] theLayer:self.layers[@"Cion"]];
        [QCMethod updateValueFromPresentationLayerForAnimation:[self.layers[@"plusSharrp"] animationForKey:@"plusSharrpMoneyDropAnim"] theLayer:self.layers[@"plusSharrp"]];
    }
}

- (void)removeAnimationsForAnimationId:(NSString *)identifier{
    if([identifier isEqualToString:@"MoneyDrop"]){
        [self.layers[@"Cion"] removeAnimationForKey:@"CionMoneyDropAnim"];
        [self.layers[@"plusSharrp"] removeAnimationForKey:@"plusSharrpMoneyDropAnim"];
    }
}

- (void)removeAllAnimations{
    [self.layers enumerateKeysAndObjectsUsingBlock:^(id key, CALayer *layer, BOOL *stop) {
        [layer removeAllAnimations];
    }];
}

#pragma mark - Bezier Path

- (UIBezierPath*)mainBackgroundPath{
    UIBezierPath * mainBackgroundPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:20];
    return mainBackgroundPath;
}

- (UIBezierPath*)shawdowPath{
    UIBezierPath * shawdowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 80, 8) cornerRadius:4];
    return shawdowPath;
}

- (UIBezierPath*)circlePath{
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 58, 58)];
    return circlePath;
}

- (UIBezierPath*)textPath{
    UIBezierPath *textPath = [UIBezierPath bezierPath];
    [textPath moveToPoint:CGPointMake(18, 30)];
    [textPath addCurveToPoint:CGPointMake(19, 27) controlPoint1:CGPointMake(19, 29) controlPoint2:CGPointMake(19, 28)];
    [textPath addCurveToPoint:CGPointMake(17, 23) controlPoint1:CGPointMake(19, 25) controlPoint2:CGPointMake(18, 24)];
    [textPath addCurveToPoint:CGPointMake(13, 21) controlPoint1:CGPointMake(16, 22) controlPoint2:CGPointMake(15, 21)];
    [textPath addLineToPoint:CGPointMake(13, 33)];
    [textPath addCurveToPoint:CGPointMake(18, 30) controlPoint1:CGPointMake(15, 32) controlPoint2:CGPointMake(17, 31)];
    [textPath closePath];
    [textPath moveToPoint:CGPointMake(6, 15)];
    [textPath addCurveToPoint:CGPointMake(10, 16) controlPoint1:CGPointMake(7, 16) controlPoint2:CGPointMake(9, 16)];
    [textPath addLineToPoint:CGPointMake(10, 6)];
    [textPath addCurveToPoint:CGPointMake(6, 8) controlPoint1:CGPointMake(8, 6) controlPoint2:CGPointMake(7, 7)];
    [textPath addCurveToPoint:CGPointMake(5, 11) controlPoint1:CGPointMake(5, 9) controlPoint2:CGPointMake(5, 10)];
    [textPath addCurveToPoint:CGPointMake(6, 15) controlPoint1:CGPointMake(5, 13) controlPoint2:CGPointMake(5, 14)];
    [textPath closePath];
    [textPath moveToPoint:CGPointMake(3, 6)];
    [textPath addCurveToPoint:CGPointMake(11, 3) controlPoint1:CGPointMake(5, 4) controlPoint2:CGPointMake(7, 3)];
    [textPath addLineToPoint:CGPointMake(11, 0)];
    [textPath addLineToPoint:CGPointMake(13, 0)];
    [textPath addLineToPoint:CGPointMake(13, 3)];
    [textPath addCurveToPoint:CGPointMake(20, 5) controlPoint1:CGPointMake(16, 3) controlPoint2:CGPointMake(18, 4)];
    [textPath addCurveToPoint:CGPointMake(22, 11) controlPoint1:CGPointMake(21, 7) controlPoint2:CGPointMake(22, 9)];
    [textPath addLineToPoint:CGPointMake(18, 11)];
    [textPath addCurveToPoint:CGPointMake(17, 9) controlPoint1:CGPointMake(18, 10) controlPoint2:CGPointMake(18, 9)];
    [textPath addCurveToPoint:CGPointMake(13, 6) controlPoint1:CGPointMake(16, 7) controlPoint2:CGPointMake(15, 6)];
    [textPath addLineToPoint:CGPointMake(13, 17)];
    [textPath addCurveToPoint:CGPointMake(20, 20) controlPoint1:CGPointMake(16, 18) controlPoint2:CGPointMake(19, 19)];
    [textPath addCurveToPoint:CGPointMake(23, 26) controlPoint1:CGPointMake(22, 21) controlPoint2:CGPointMake(23, 23)];
    [textPath addCurveToPoint:CGPointMake(19, 34) controlPoint1:CGPointMake(23, 30) controlPoint2:CGPointMake(22, 32)];
    [textPath addCurveToPoint:CGPointMake(13, 36) controlPoint1:CGPointMake(18, 35) controlPoint2:CGPointMake(16, 35)];
    [textPath addLineToPoint:CGPointMake(13, 40)];
    [textPath addLineToPoint:CGPointMake(11, 40)];
    [textPath addLineToPoint:CGPointMake(11, 36)];
    [textPath addCurveToPoint:CGPointMake(1, 31) controlPoint1:CGPointMake(6, 35) controlPoint2:CGPointMake(3, 34)];
    [textPath addCurveToPoint:CGPointMake(0, 25) controlPoint1:CGPointMake(0, 30) controlPoint2:CGPointMake(0, 28)];
    [textPath addLineToPoint:CGPointMake(4, 25)];
    [textPath addCurveToPoint:CGPointMake(5, 30) controlPoint1:CGPointMake(4, 27) controlPoint2:CGPointMake(5, 29)];
    [textPath addCurveToPoint:CGPointMake(10, 32) controlPoint1:CGPointMake(6, 31) controlPoint2:CGPointMake(8, 32)];
    [textPath addLineToPoint:CGPointMake(10, 20)];
    [textPath addCurveToPoint:CGPointMake(3, 17) controlPoint1:CGPointMake(7, 20) controlPoint2:CGPointMake(5, 19)];
    [textPath addCurveToPoint:CGPointMake(1, 12) controlPoint1:CGPointMake(1, 16) controlPoint2:CGPointMake(1, 14)];
    [textPath addCurveToPoint:CGPointMake(3, 6) controlPoint1:CGPointMake(1, 9) controlPoint2:CGPointMake(2, 7)];
    [textPath closePath];
    [textPath moveToPoint:CGPointMake(3, 6)];
    
    return textPath;
}

- (UIBezierPath*)maskCionViewPath{
    UIBezierPath * maskCionViewPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 60, 38)];
    return maskCionViewPath;
}

- (UIBezierPath*)backgroundMaskPath{
    UIBezierPath * backgroundMaskPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 30)];
    return backgroundMaskPath;
}

- (UIBezierPath*)plusSharrpPath{
    UIBezierPath *plusSharrpPath = [UIBezierPath bezierPath];
    [plusSharrpPath moveToPoint:CGPointMake(0, 5)];
    [plusSharrpPath addLineToPoint:CGPointMake(0, 3)];
    [plusSharrpPath addLineToPoint:CGPointMake(3, 3)];
    [plusSharrpPath addLineToPoint:CGPointMake(3, 0)];
    [plusSharrpPath addLineToPoint:CGPointMake(5, 0)];
    [plusSharrpPath addLineToPoint:CGPointMake(5, 3)];
    [plusSharrpPath addLineToPoint:CGPointMake(8, 3)];
    [plusSharrpPath addLineToPoint:CGPointMake(8, 5)];
    [plusSharrpPath addLineToPoint:CGPointMake(5, 5)];
    [plusSharrpPath addLineToPoint:CGPointMake(5, 8)];
    [plusSharrpPath addLineToPoint:CGPointMake(3, 8)];
    [plusSharrpPath addLineToPoint:CGPointMake(3, 5)];
    [plusSharrpPath closePath];
    [plusSharrpPath moveToPoint:CGPointMake(0, 5)];
    
    return plusSharrpPath;
}


@end