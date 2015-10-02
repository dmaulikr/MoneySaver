//
//  UILabel+MSProjectTypeText.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UILabel+MoneySaver.h"

@implementation UILabel (MSProjectTypeText)
@dynamic projectType;

- (void)setProjectType:(MSProjectModelType)projectType
{
    self.text = [MSProjectModelTypeHelper projectModelTypeToChinese:projectType];
}

@end
