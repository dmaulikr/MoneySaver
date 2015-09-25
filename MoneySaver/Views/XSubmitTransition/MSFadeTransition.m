//
//  FadeTransition.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSFadeTransition.h"

@interface MSFadeTransition ()

@property (nonatomic, assign) NSTimeInterval transitionDuration;
@property (nonatomic, assign) CGFloat startingAlpha;

@end

@implementation MSFadeTransition

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transitionDuration = 0.5f;
        _startingAlpha = 0.0f;
    }
    return self;
}


- (instancetype)initWothDuration:(NSTimeInterval)duration starAkpha:(CGFloat)alpha
{
    self = [super init];
    if (self) {
        _transitionDuration = duration;
        _startingAlpha = alpha;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return _transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    //获取VC快照
    UIView *toView = [[transitionContext viewForKey:UITransitionContextToViewKey] snapshotViewAfterScreenUpdates:NO];
    UIView *fromView = [[transitionContext viewForKey:UITransitionContextFromViewKey] snapshotViewAfterScreenUpdates:NO];
    toView.alpha = _startingAlpha;
    fromView.alpha = 1.0f;
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.alpha = 1.0f;
        fromView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        fromView.alpha = 1.0f;
        [transitionContext completeTransition:true];
    }];
}

@end
