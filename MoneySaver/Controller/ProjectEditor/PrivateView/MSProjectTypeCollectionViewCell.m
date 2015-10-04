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
#import <ReactiveCocoa.h>

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
    
    [self.typeNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
        make.bottom.equalTo(self.contentView).offset(-8);
        make.height.mas_equalTo(kTypeNameLableHeight);
    }];
    
    [self.typeImage mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, kTypeNameLableHeight+(10*2), 10));
    }];
    
    [RACObserve(self, selected) subscribeNext:^(NSNumber *x) {
        @strongify(self);
        self.typeNameLable.textColor = x.boolValue?[UIColor ms_DefaultColor]:[UIColor darkGrayColor];
    }];
    

}


#pragma mark -Setter
- (void)setProjectType:(MSProjectModelType )projectType
{
    _projectType = projectType;
    self.typeImage.projectType = projectType;
    self.typeNameLable.projectType = projectType;
}

#pragma mark - Getter

- (UIImageView *)typeImage
{
    if (!_typeImage) {
        _typeImage = [UIImageView new];
        _typeImage.contentMode = UIViewContentModeScaleAspectFit;
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
