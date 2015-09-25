//
//  NSTimer+MSSubmitTransition.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (MSSubmitTransition)

+ (NSTimer *)scheduleDelay:(NSTimeInterval)delay  handle:(void (^) (CFRunLoopTimerRef timer))handle;
+ (NSTimer *)scheduleRepeatInterval:(NSTimeInterval)interval  handle:(void (^) (CFRunLoopTimerRef timer))handle;

@end
