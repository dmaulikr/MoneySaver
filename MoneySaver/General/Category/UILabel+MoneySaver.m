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

@implementation UILabel (MSLogoText)

+ (instancetype)ms_logoTextWithSize:(CGFloat)size
{
    UILabel *lable = [UILabel new];
    NSMutableAttributedString *muAttr = [[NSMutableAttributedString alloc] initWithString:@" MoneySaver+"];
    [muAttr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],
                            NSForegroundColorAttributeName:[UIColor darkGrayColor]}
                    range:NSMakeRange(0, muAttr.string.length-2)];
    [muAttr addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:size],
                            NSForegroundColorAttributeName:[UIColor ms_GreenColor]}
                    range:NSMakeRange(muAttr.string.length-2, 1)];
    lable.attributedText = muAttr;
    [lable sizeToFit];
    return lable;
}


@end
