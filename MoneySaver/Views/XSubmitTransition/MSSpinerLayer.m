//
//  MSSpinerLayer.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSpinerLayer.h"
#import <UIKit/UIKit.h>

@implementation MSSpinerLayer


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        
        CGFloat radius = (frame.size.height / 2) * 0.5;
        self.frame = CGRectMake(0, 0, frame.size.height, frame.size.height);
        
        CGPoint center = CGPointMake(frame.size.height / 2, CGRectGetMidY(self.bounds));
        CGFloat startAngle = 0 - M_PI_2;
        CGFloat endAngle = M_PI * 2 - M_PI_2;
        BOOL clockwise  = true;
        
        self.path = [UIBezierPath bezierPathWithArcCenter:center
                                                   radius:radius
                                               startAngle:startAngle
                                                 endAngle:endAngle
                                                clockwise:clockwise].CGPath;
        self.fillColor = nil;
        self.strokeColor = [UIColor whiteColor].CGColor;
        self.lineWidth = 1;
        
        self.strokeEnd = 0.4;
        self.hidden = true;
    }
    return self;
}

- (void)animation
{
    self.hidden = false;
    CABasicAnimation *rotate = [[CABasicAnimation alloc] init];
    rotate.keyPath = @"transform.rotation.z";
    rotate.fromValue = @0;
    rotate.toValue = @(M_PI * 2);
    rotate.duration = 0.4;
    rotate.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotate.repeatCount = HUGE;
    rotate.fillMode = kCAFillModeForwards;
    rotate.removedOnCompletion = false;
    [self addAnimation:rotate forKey:rotate.keyPath];
}

- (void)stopAnimation
{
    self.hidden = true;
    [self removeAllAnimations];
}

@end
