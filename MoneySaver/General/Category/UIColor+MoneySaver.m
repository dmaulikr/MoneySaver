//
//  UIColor+MSDefaultColor.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/24.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIColor+MoneySaver.h"
#import <Chameleon.h>

@implementation UIColor (MoneySaver)

+ (UIColor *)ms_DefaultColor
{
    return [UIColor ms_GreenColor];
}

+ (UIColor *)ms_DisableColor
{
    return [UIColor grayColor];
}

+ (UIColor *)ms_itemTintColor
{
    return [UIColor whiteColor];
}







+ (UIColor *)ms_RedColor
{
    return [UIColor colorWithRed:0.949  green:0.439  blue:0.467 alpha:1];
}

+ (UIColor *)ms_GreenColor
{
    return [UIColor colorWithRed:0.427  green:0.796  blue:0.541 alpha:1];
}



@end
