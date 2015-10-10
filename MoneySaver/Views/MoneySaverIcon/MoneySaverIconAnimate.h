//
//  MoneySaverIconAnimate.h
//  MoneySaver
//
//  Created by Tbxark on 9/10/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface MoneySaverIconAnimate : UIView

- (void)addMoneyDropAnimation;
- (void)addMoneyDropAnimationCompletionBlock:(void (^)(BOOL finished))completionBlock;
- (void)removeAnimationsForAnimationId:(NSString *)identifier;
- (void)removeAllAnimations;

@end
