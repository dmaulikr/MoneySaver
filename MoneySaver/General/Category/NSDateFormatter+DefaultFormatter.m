//
//  NSDateFormatter+DefaultFormatter.m
//  YiPaiHelper
//
//  Created by Tbxark on 15/7/31.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import "NSDateFormatter+DefaultFormatter.h"

static NSDateFormatter *_defaultFormatter;
static NSString *const kCommonDateFormatter = @"yyyy-MM-dd";
static NSString *const kFullDateFormatter = @"yyyy-MM-dd hh:mm:ss";


@implementation NSDateFormatter (DefaultFormatter)

+ (instancetype)defaultFormatter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_defaultFormatter) {
            _defaultFormatter = [[NSDateFormatter alloc] init];
        }
    });
    return _defaultFormatter;
}


+ (instancetype)commonDateFormatter
{
    NSDateFormatter *formatter = [NSDateFormatter defaultFormatter];
    formatter.dateFormat = kCommonDateFormatter;
    return formatter;
}

+ (instancetype)fullDateFormatter
{
    NSDateFormatter *formatter = [NSDateFormatter defaultFormatter];
    formatter.dateFormat = kFullDateFormatter;
    return formatter;
}


@end
