//
//  MSSubmitTransitionButton.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSSubmitTransitionButton : UIButton


@property (nonatomic, copy) void(^loadingComplete)();


- (void)startLoadingAnimation;
- (void)startFinishAnimation;
- (void)stopLodingAnimation;


//测试
- (void)animate:(NSTimeInterval)duration complete:(void(^)())complete;


@end
