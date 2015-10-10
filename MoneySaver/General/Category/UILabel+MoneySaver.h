//
//  UILabel+MSProjectTypeText.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectModelTypeHelper.h"

@interface UILabel (MSProjectTypeText)

@property (nonatomic, assign) MSProjectModelType projectType; ///< 项目类型

@end


@interface UILabel (MSLogoText)

+ (instancetype)ms_logoTextWithSize:(CGFloat)size;

@end