//
//  MSNumberKeyBordButton.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/25.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSNumberKeyBordButton.h"

NSString *MSNumberKeyBordButtonTypeToString(MSNumberKeyBordButtonType type)
{
    switch (type) {

        case MSNumberKeyBordPointButtonType: {
            return @".";
        }
        case MSNumberKeyBordAddButtonType:
        {
            return @"+";
        }
        case MSNumberKeyBordDeleteButtonType: {
            return @"←";
        }
        case MSNumberKeyBordCommiteButtonType: {
            return @"确认";
        }
        default: {
            return [NSString stringWithFormat:@"%lu",(unsigned long)type];
        }
    }
}

@interface MSNumberKeyBordButton ()

@end

@implementation MSNumberKeyBordButton

+ (instancetype)buttonWithType:(MSNumberKeyBordButtonType)type
{
    return [[MSNumberKeyBordButton alloc] initWithType:type];
}

- (instancetype)initWithType:(MSNumberKeyBordButtonType)type
{
    self = [super init];
    if (self) {
        _type = type;
        [self configureButton];
    }
    return self;
}

- (void)configureButton
{
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage new] forState:UIControlStateHighlighted];
    [self setTitle:MSNumberKeyBordButtonTypeToString(_type) forState:UIControlStateNormal];
}

@end
