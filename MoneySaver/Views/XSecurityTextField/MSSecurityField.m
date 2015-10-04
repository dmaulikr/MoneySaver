//
//  MSSecurityField.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/4.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSecurityField.h"
#import "UIColor+MoneySaver.h"

@interface MSSecurityField ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *showTextLable;
@property (nonatomic, strong) NSMutableAttributedString *showString;


@end

@implementation MSSecurityField

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
        [self configureField];
    }
    return self;
}

- (void)defaultInit
{
    _charForPassword = @"*";
    _numOfPassword   = 4;
    _filedColor      = [UIColor ms_DefaultColor];
    self.tintColor = [UIColor clearColor];
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.keyboardAppearance = UIKeyboardAppearanceDark;
    self.borderStyle = UITextBorderStyleNone;
    self.textColor = [UIColor clearColor];
    self.delegate = self;
}

- (void)reloadViewConfigure
{
    [self.showTextLable removeFromSuperview];
}

- (void)configureField
{
    [self addSubview:self.showTextLable];
}

#pragma mark - Private Method
- (void)changeShowTextViewForString:(NSString *)str
{
    NSLog(@"%@",str);
    NSInteger strLength = str.length;
    NSMutableString *muStr = [NSMutableString new];
    for (NSInteger count = 0; count < self.numOfPassword; count ++) {
        NSString *character = (count >= strLength)?@"_":(self.charForPassword?:@"*");
        [muStr appendString:character];
        if (count == self.numOfPassword -1) {continue;}
        [muStr appendString:@" "];
    }
    [self.showString.mutableString setString:muStr];
    self.showTextLable.attributedText = self.showString;
}

- (void)securityInputAttribute
{
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSMutableString *text = [NSMutableString stringWithString:textField.text];
    [text replaceCharactersInRange:range withString:string];
    NSString *regxStr = [NSString stringWithFormat:@"^[0-9]{0,%ld}$",self.numOfPassword];
    if (text.length <= self.numOfPassword &&
        [text rangeOfString:regxStr options:NSRegularExpressionSearch].location != NSNotFound) {
        [self changeShowTextViewForString:text];
        return YES;
    }
    return NO;
}



#pragma mark - Getter
- (UILabel *)showTextLable
{
    if (!_showTextLable) {
        _showTextLable = [[UILabel alloc] initWithFrame:self.bounds];
        _showTextLable.textColor = self.filedColor;

        _showTextLable.attributedText = self.showString;
        _showTextLable.textAlignment = NSTextAlignmentCenter;
        _showTextLable.font = [UIFont boldSystemFontOfSize:CGRectGetHeight(self.bounds)-8];
    }
    return _showTextLable;
}

- (NSMutableAttributedString *)showString
{
    if (!_showString) {
        NSMutableString *muStr = [[NSMutableString alloc] initWithString:@" "];
        for (NSInteger count = 1; count < self.numOfPassword; count ++) {
            [muStr appendFormat:@" a"];
        }
        _showString = [[NSMutableAttributedString alloc] initWithString:muStr];
        for (NSInteger count = 0; count < self.numOfPassword; count ++) {
            [_showString addAttributes:@{NSUnderlineStyleAttributeName:@4,
                                         NSUnderlineColorAttributeName:[UIColor ms_DefaultColor]} range:NSMakeRange(count*2, 1)];
        }
        
    }
    return _showString;
}



@end
