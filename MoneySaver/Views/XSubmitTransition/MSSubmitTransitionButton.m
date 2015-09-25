//
//  MSSubmitTransitionButton.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSubmitTransitionButton.h"
#import "MSCircleLayer.h"
#import "NSTimer+MSSubmitTransition.h"

static UIColor *PINK                 = nil;
static UIColor *DARK_PINK            = nil;
static CFTimeInterval kShrinkDuration = 0.1;


@interface MSSubmitTransitionButton ()

@property (nonatomic, strong) CAMediaTimingFunction *springGoEase;
@property (nonatomic, strong) CAMediaTimingFunction *shrinkCurve;
@property (nonatomic, strong) CAMediaTimingFunction *expandCurve;

@property (nonatomic, strong) UIColor *highlightedBackgroundColor;
@property (nonatomic, strong) UIColor *normalBackgroundColor;


@property (nonatomic, strong) MSCircleLayer *spiner;
@property (nonatomic, copy)   NSString *cachedTitle;



@end

@implementation MSSubmitTransitionButton

#pragma mark - Life Cycle

+ (void)load
{
    [super load];
    PINK = [UIColor colorWithRed:1 green:0.2 blue:0.4 alpha:1];
    DARK_PINK = [UIColor colorWithRed:0.8 green:0.17 blue:0.32 alpha:1];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

#pragma mark - Private Method

- (void)setUp
{
    
    //时间函数
    _springGoEase = [CAMediaTimingFunction functionWithControlPoints:0.45 :-0.36 :0.44 :0.92];
    _shrinkCurve  = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _expandCurve  = [CAMediaTimingFunction functionWithControlPoints:0.95 :0.2 :1 :0.05];

    _highlightedBackgroundColor = PINK;
    _normalBackgroundColor      = DARK_PINK;
    
    self.layer.cornerRadius = self.frame.size.height / 2;
    self.clipsToBounds      = true;
    [self setBackgroundColor];
}

- (void)setBackgroundColor
{
    if (self.highlighted) {
        self.backgroundColor = _highlightedBackgroundColor;
    }
    else {
        self.backgroundColor = _normalBackgroundColor;
    }
}


//测试用
- (void)animate:(NSTimeInterval)duration complete:(void(^)())complete
{
    [self startLoadingAnimation];
    [NSTimer scheduleDelay:duration handle:^(CFRunLoopTimerRef timer) {
        complete();
    }];
}


#pragma mark - Animate Opetarion
- (void)startLoadingAnimation
{
    self.cachedTitle = [self titleForState:UIControlStateNormal];
    [self setTitle:@"" forState:UIControlStateNormal];
    [self shrink];
    [NSTimer scheduleDelay:(kShrinkDuration) handle:^(CFRunLoopTimerRef timer) {
        [self.spiner animation];
    }];
}

- (void)stopLodingAnimation
{
    [self backShrink];
    [self.spiner stopAnimation];
    [NSTimer scheduleDelay:(kShrinkDuration) handle:^(CFRunLoopTimerRef timer) {
        [self returnToOriginalState];
    }];
}

- (void)startFinishAnimation
{
    [self expand];
    [self.spiner stopAnimation];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if ([anim isKindOfClass:[CABasicAnimation class]]) {
        CABasicAnimation *basic = (CABasicAnimation *)anim;
        //当动画为expand时
        if ([basic.keyPath isEqualToString:@"transform.scale"]) {
            if (self.loadingComplete) {
                self.loadingComplete();
            }
            [NSTimer scheduleDelay:1 handle:^(CFRunLoopTimerRef timer) {
                [self returnToOriginalState];
            }];
        }
    }
}


- (void)returnToOriginalState
{
    [self.layer removeAllAnimations];
    [self setTitle:self.cachedTitle forState:UIControlStateNormal];
}

#pragma mark - Basic Animate

// 变长
- (void)shrink
{
    CABasicAnimation *shrinkAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    shrinkAnim.fromValue = @(self.frame.size.width);
    shrinkAnim.toValue = @(self.frame.size.height);
    shrinkAnim.duration = kShrinkDuration;
    shrinkAnim.timingFunction = self.shrinkCurve;
    shrinkAnim.fillMode = kCAFillModeForwards;
    shrinkAnim.removedOnCompletion = false;
    [self.layer addAnimation:shrinkAnim forKey:shrinkAnim.keyPath];
}

// 变短
- (void)backShrink
{
    CABasicAnimation *shrinkAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
    shrinkAnim.fromValue = @(self.frame.size.height);
    shrinkAnim.toValue = @(self.frame.size.width);
    shrinkAnim.duration = kShrinkDuration;
    shrinkAnim.timingFunction = self.shrinkCurve;
    shrinkAnim.fillMode = kCAFillModeForwards;
    shrinkAnim.removedOnCompletion = true;
    [self.layer addAnimation:shrinkAnim forKey:shrinkAnim.keyPath];
}

// 展开
- (void)expand
{
    CABasicAnimation *expandAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnim.fromValue = @1.0;
    expandAnim.toValue = @40.0;
    expandAnim.timingFunction = self.expandCurve;
    expandAnim.duration = 0.3;
    expandAnim.delegate = self;
    expandAnim.fillMode = kCAFillModeForwards;
    expandAnim.removedOnCompletion = false;
    [self.layer addAnimation:expandAnim forKey:expandAnim.keyPath];
    
    
}


#pragma mark - Setter
- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor
{
    _highlightedBackgroundColor = highlightedBackgroundColor;
    [self setBackgroundColor];
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    _normalBackgroundColor = normalBackgroundColor;
    [self setBackgroundColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setBackgroundColor];
}


#pragma mark - Getter
- (MSCircleLayer *)spiner
{
    if (!_spiner) {
        _spiner = [[MSCircleLayer alloc] initWithFrame:self.frame];
        [self.layer addSublayer:_spiner];
    }
    return _spiner;
}

@end
