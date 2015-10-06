//
//  NSString+XValueCheck.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/6.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "NSString+XValueCheck.h"

@implementation NSString (XValueCheck)

- (BOOL)validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)validateMobile
{
    //手机号以13，15，17,18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^[1][3-8]+\\d{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
    
}



@end
