//
//  NSDateFormatter+DefaultFormatter.h
//  YiPaiHelper
//
//  Created by Tbxark on 15/7/31.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (DefaultFormatter)

+ (instancetype)defaultFormatter;

/**
 *  YYYY-MM-DD
 *
 *  @return YYYY-MM-DD
 */+ (instancetype)commonDateFormatter;

/**
 *  YYYY-MM-DD hh:mm:ss
 *
 *  @return YYYY-MM-DD hh:mm:ss
 */
+ (instancetype)fullDateFormatter;

@end
