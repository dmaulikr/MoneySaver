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
@property (nonatomic, strong) UIImageView *projectTypeImage;

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
        [self configureView];
        [self configureSignal];
    }
    return self;
}


#pragma mark - Private Method
- (void)configureView
{
    [self addSubview:self.valueFiled];
    [self addSubview:self.moneyTypeImage];
    [self addSubview:self.projectTypeImage];
    
    
    @weakify(self);
    CGFloat height = kMSProjectValueHeaderViewHeight;
    CGFloat imageHeight = 20;
    CGFloat imageSpace = 20;
    CGFloat textfieldInset = imageHeight + imageSpace*2;
    CGRect textFrame = {{(textfieldInset),0},{SCREEN_WIDTH - textfieldInset*2,height}};
    
    self.valueFiled.frame = textFrame;
    self.valueFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [self.moneyTypeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.size.mas_equalTo(CGSizeMake(imageHeight, imageHeight));
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(imageSpace);
    }];
    [self.projectTypeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.size.mas_equalTo(CGSizeMake(imageHeight, imageHeight));
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-imageSpace);
    }];
}


- (void)configureSignal
{
    @weakify(self);
    RAC(self,projectTypeImage.image) = [[RACObserve(self, viewModel.dataModel.projectType) filter:^BOOL(id value) {
        return (value != nil);
    }]map:^id(NSNumber *value) {
        @strongify(self);
        return [MSProjectModelTypeHelper projectModelTypeToImage:value.unsignedIntegerValue size:self.moneyTypeImage.bounds.size hightlight:NO];
    }];
    
}



#pragma mark - Getter
- (UITextField *)valueFiled
{
    if (!_valueFiled) {
        _valueFiled = [[UITextField alloc] initWithFrame:CGRectZero];
        _valueFiled.textAlignment = NSTextAlignmentCenter;
        _valueFiled.textColor = [UIColor ms_DefaultColor];
        _valueFiled.tintColor = [UIColor clearColor];
        _valueFiled.adjustsFontSizeToFitWidth = YES;
        _valueFiled.font = [UIFont systemFontOfSize:40];
        _valueFiled.placeholder = @"请输入金额";
    }
    return _valueFiled;
}


- (UIImageView *)moneyTypeImage
{
    if (!_moneyTypeImage) {
        _moneyTypeImage = [UIImageView new];
        _moneyTypeImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _moneyTypeImage;
}

- (UIImageView *)projectTypeImage
{
    if (!_projectTypeImage) {
        _projectTypeImage = [UIImageView new];
        _projectTypeImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _projectTypeImage;
}


@end
