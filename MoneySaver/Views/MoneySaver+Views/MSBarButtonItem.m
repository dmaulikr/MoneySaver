//
//  UIBarButtonItem+MoneySaver.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBarButtonItem.h"
#import "UIImage+MoneySaver.h"
#import "UIColor+MoneySaver.h"


@implementation MSBarButtonItem


+ (instancetype)buttonWithMSImageType:(MSCustomIconType)type
{
    UIImage *image = [UIImage imageWithType:type
                                       size:NAVIGATIONBAR_HEIGHT/2
                                  tintColor:[UIColor ms_itemTintColor]];
    
    MSBarButtonItem *item = [[MSBarButtonItem alloc] initWithImage:image
                                                             style:UIBarButtonItemStylePlain
                                                            target:nil
                                                            action:nil];
    [item setTarget:item];
    [item setAction:@selector(barButtonAction:)];
    return item;
}






+ (instancetype)backButton
{
    UIImage *image = [UIImage imageWithType:MSCustomBackIcon
                                       size:NAVIGATIONBAR_HEIGHT
                                  tintColor:[UIColor ms_itemTintColor]];
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, NAVIGATIONBAR_HEIGHT/2, NAVIGATIONBAR_HEIGHT)];
    backImage.image = image;
    MSBarButtonItem *item = [[MSBarButtonItem alloc] initWithCustomView:backImage];
    return item;
}

+ (instancetype)closeButton
{
    return [MSBarButtonItem buttonWithMSImageType:MSCustomCloseIcon];
}

+ (instancetype)calendarButton
{
    return [MSBarButtonItem buttonWithMSImageType:MSCustomCalendarIcon];
}

+ (instancetype)noteButton
{
    return [MSBarButtonItem buttonWithMSImageType:MSCustomNoteIcon];
}

+ (instancetype)chartButton
{
    return [MSBarButtonItem buttonWithMSImageType:MSCustomChartIcon];
}



- (void)barButtonAction:(id)sender
{
    if (_barButtonActionBlock) {
        _barButtonActionBlock(sender);
    }
}



@end
