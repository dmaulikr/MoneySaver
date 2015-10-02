//
//  MSMSProjectTypeCollectionViewCell.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectTypeCollectionViewCell.h"

#import "UIImageView+MoneySaver.h"
#import "UILabel+MoneySaver.h"

#import <Masonry.h>

#define kTypeNameLableHeight 20


@interface MSProjectTypeCollectionViewCell ()

@property (nonatomic, strong) UILabel *typeNameLable;
@property (nonatomic, strong) UIImageView *typeImage;

@end

@implementation MSProjectTypeCollectionViewCell

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureCell];
    }
    return self;
}

#pragma mark - Private Method
- (void)configureCell
{
    @weakify(self);
    [self.contentView addSubview:self.typeImage];
    [self.contentView addSubview:self.typeNameLable];
    
    
    [self.typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.top.equalTo(self.contentView).offset(8);
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(self.typeNameLable.mas_top).offset(8);
    }];
    
    [self.typeNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.height.mas_equalTo(kTypeNameLableHeight);
    }];
}


#pragma mark -Setter
- (void)setProjectType:(MSProjectModelType )projectType
{
    _projectType = projectType;
    self.typeImage.projectType = projectType;
    self.typeNameLable.projectType = projectType;
}

- (void)setSelected:(BOOL)selected
{
    self.selected = selected;
    self.typeImage.highlighted = selected;
}

#pragma mark - Getter

- (UIImageView *)typeImage
{
    if (!_typeImage) {
        _typeImage = [UIImageView new];
    }
    return _typeImage;
}

- (UILabel *)typeNameLable
{
    if (!_typeNameLable) {
        _typeNameLable = [UILabel new];
        _typeNameLable.textColor = [UIColor darkGrayColor];
        _typeNameLable.textAlignment = NSTextAlignmentCenter;
        _typeNameLable.font = [UIFont systemFontOfSize:12];
    }
    return _typeNameLable;
}



@end
