//
//  UIImage+MoneySaver.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIImage+MoneySaver.h"
#import <FontAwesomeKit/FAKFontAwesome.h>


NSString *MSCustomIconTypeToString(MSCustomIconType type)
{
    switch (type) {
        case MSCustomBackIcon:return @"\uf053";
        case MSCustomCloseIcon:return @"\uf00d";
        case MSCustomNoteIcon:return @"\uf040";
        case MSCustomCalendarIcon:return @"\uf073";
        case MSCustomChartIcon:return @"\uf200";
        default:return @"";
    }
}

@implementation UIImage (MoneySaver)

+ (instancetype)imageWithCode:(NSString *)code size:(CGFloat)size tintColor:(UIColor *)color
{
    if (color == nil) {
        color = [UIColor darkGrayColor];
    }
    FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:code size:size];
    [icon addAttribute:NSForegroundColorAttributeName value:color];
    return [icon imageWithSize:CGSizeMake(size, size)];

}

+ (instancetype)imageWithType:(MSCustomIconType)type size:(CGFloat)size tintColor:(UIColor *)color
{
    NSString *code = MSCustomIconTypeToString(type);
    return [UIImage imageWithCode:code size:size tintColor:color];
}




@end
