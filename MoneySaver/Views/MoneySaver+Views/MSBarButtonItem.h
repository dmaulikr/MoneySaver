//
//  UIBarButtonItem+MoneySaver.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+MoneySaver.h"

@interface MSBarButtonItem : UIBarButtonItem

@property (nonatomic, copy) void (^barButtonActionBlock)(id sender);

+ (instancetype)buttonWithMSImageType:(MSCustomIconType)type;


+ (instancetype)backButton;
+ (instancetype)closeButton;
+ (instancetype)calendarButton;
+ (instancetype)noteButton;
+ (instancetype)chartButton;


@end

