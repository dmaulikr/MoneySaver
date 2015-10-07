//
//  MSProjectListTableViewCell.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/26.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectListTableViewCell.h"
#import "MSProjectListTableViewCellTypeView.h"
#import <ReactiveCocoa/RACEXTScope.h>
#import <Masonry.h>

#define kSpaceOfLineForProjectCell  40
#define kWidthOfLineForProjectCell  8



@interface MSProjectListTableViewCell ()

@property (nonatomic, strong) MSProjectListTableViewCellTypeView *typeView;
@property (nonatomic, strong) UIImageView                        *typeImage;
@property (nonatomic, strong) UILabel                            *typeLable;
@property (nonatomic, strong) UILabel                            *dataLable;
@property (nonatomic, strong) UILabel                            *moneyCountLable;
@property (nonatomic, strong) UILabel                            *moneyTypeLable;

@end

@implementation MSProjectListTableViewCell

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}


- (void)configureCell
{
    [self.contentView addSubview:self.typeView];
    [self.contentView addSubview:self.typeImage];
    [self.contentView addSubview:self.typeLable];
    [self.contentView addSubview:self.dataLable];
    [self.contentView addSubview:self.moneyCountLable];
    [self.contentView addSubview:self.moneyTypeLable];
    
    @weakify(self);
    
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self.contentView).offset(kSpaceOfLineForProjectCell);
        make.top.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(kRadiusForTypeCircle*2);
    }];
}


#pragma mark - Getter
- (MSProjectListTableViewCellTypeView *)typeView
{
    if (!_typeView) {
        _typeView = [MSProjectListTableViewCellTypeView new];
    }
    return _typeView;
}

- (UIImageView *)typeImage
{
    if (!_typeImage) {
        _typeImage = [UIImageView new];
    }
    return _typeImage;
}

- (UILabel *)typeLable
{
    if (!_typeLable) {
        _typeLable = [UILabel new];
    }
    return _typeLable;
}

- (UILabel *)dataLable
{
    if (!_dataLable) {
        _dataLable = [UILabel new];
    }
    return _dataLable;
}
- (UILabel *)moneyCountLable
{
    if (!_moneyCountLable) {
        _moneyCountLable = [UILabel new];
    }
    return _moneyCountLable;
}
- (UILabel *)moneyTypeLable
{
    if (!_moneyTypeLable) {
        _moneyTypeLable = [UILabel new];
    }
    return _moneyTypeLable;
}

@end
