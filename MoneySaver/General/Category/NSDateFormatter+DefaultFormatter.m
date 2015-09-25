//
//  NSDateFormatter+DefaultFormatter.m
//  YiPaiHelper
//
//  Created by Tbxark on 15/7/31.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import "NSDateFormatter+DefaultFormatter.h"

static NSDateFormatter *_defaultFormatter;

@implementation NSDateFormatter (DefaultFormatter)

+ (instancetype)defaultFormatter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_defaultFormatter) {
            _defaultFormatter = [[NSDateFormatter alloc] init];
            _defaultFormatter.dateFormat = @"yyyy/MM/dd";
        }
    });
    return _defaultFormatter;
}


@end
