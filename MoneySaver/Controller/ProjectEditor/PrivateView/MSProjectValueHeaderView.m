//
//  MSProjectValueHeaderView.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/3.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectValueHeaderView.h"
#import "UIColor+MoneySaver.h"
#import <Masonry.h>

@interface MSProjectValueHeaderView ()

@property (nonatomic, strong, readwrite) UITextField *valueFiled;
@property (nonatomic, strong) UIImageView *moneyTypeImage;

@end

@implementation MSProjectValueHeaderView

#pragma mark - Life Cycle

+ (instancetype)projectValueHeaderView
{
    return [[MSProjectValueHeaderView alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    frame.size.width = SCREEN_WIDTH;
    frame.size.height = kMSProjectValueHeaderViewHeight;
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


#pragma mark - Private Method
- (void)configureView
{
    [self addSubview:self.valueFiled];
    [self addSubview:self.moneyTypeImage];
    
    
    @weakify(self);
    [self.valueFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self).offset(8);
        make.bottom.equalTo(self).offset(-8);
        make.left.equalTo(self.moneyTypeImage.mas_width).offset(8);
        make.right.equalTo(self.valueFiled.mas_left).offset(8);
    }];
    
    [self.moneyTypeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.left.and.bottom.equalTo(self).width.insets(UIEdgeInsetsMake(8, 8, 8, 0));
        make.height.equalTo(self.valueFiled.mas_width);

    }];
}


#pragma mark - Getter
- (UITextField *)valueFiled
{
    if (!_valueFiled) {
        _valueFiled = [[UITextField alloc] initWithFrame:CGRectZero];
        _valueFiled.textAlignment = NSTextAlignmentCenter;
        _valueFiled.textColor = [UIColor ms_DefaultColor];
    }
    return _valueFiled;
}


- (UIImageView *)moneyTypeImage
{
    if (!_moneyTypeImage) {
        _moneyTypeImage = [UIImageView new];
    }
    return _moneyTypeImage;
}







@end
