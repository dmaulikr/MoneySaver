//
//  UIView+XExplode.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/10.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XExplode)

@property (nonatomic, strong) NSMutableArray *boomCells;
@property (nonatomic, strong) UIImage *scaleSnapshot;


- (void)resetBoomAnimateState;
- (void)boomAnimate:(void (^) (CFRunLoopTimerRef timer))animateComplete;


@end
