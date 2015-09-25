//
//  NSTimer+MSSubmitTransition.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "NSTimer+MSSubmitTransition.h"

@implementation NSTimer (MSSubmitTransition)

+ (NSTimer *)scheduleDelay:(NSTimeInterval)delay  handle:(void (^) (CFRunLoopTimerRef timer))handle
{
    CFAbsoluteTime fireDate = delay + CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handle);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    return (__bridge NSTimer *)(timer);
}


+ (NSTimer *)scheduleRepeatInterval:(NSTimeInterval)interval  handle:(void (^) (CFRunLoopTimerRef timer))handle
{
    CFAbsoluteTime fireDate = interval + CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, handle);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    return (__bridge NSTimer *)(timer);
}

@end
