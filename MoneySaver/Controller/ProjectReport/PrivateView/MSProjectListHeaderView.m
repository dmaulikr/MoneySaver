//
//  MSProjectListHeaderView.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/27.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectListHeaderView.h"
#import <PNChart.h>
#import <Masonry.h>

#import "MSChartDataItemAdapter.h"


#define kListHeaderTopLableHeight  20
#define kRadiusOfTypePieChartScale (0.6)

@interface MSProjectListHeaderView ()

@property (nonatomic, strong) UILabel    *expenLable;
@property (nonatomic, strong) UILabel    *balanceLable;
@property (nonatomic, strong) PNPieChart *typePieChart;
@property (nonatomic, strong) UIView     *legendViewForChart;

@end

@implementation MSProjectListHeaderView

#pragma mark - Life Cycle
+ (instancetype)projectListHeaderView
{
    return [[MSProjectListHeaderView alloc] initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpHeaderView];
    }
    return self;
}
#pragma mark - Private Method

- (void)setUpHeaderView
{
    [self configureView];
    [self configureSignal];
}

- (void)configureView
{
    // 标题提示
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    
    UILabel *expenLableTip = [self createTipLable];
    expenLableTip.textAlignment = NSTextAlignmentLeft;
    expenLableTip.text = @"- 支出";
    
    UILabel *balanceLable = [self createTipLable];
    balanceLable.textAlignment = NSTextAlignmentRight;
    balanceLable.text = @"余额 -";

    
    
    @weakify(self);
    @weakify(expenLableTip);
    @weakify(balanceLable);
    
    CGFloat tipLableHeight   = 20;
    CGFloat valueLableHeight = 40;
    CGFloat commonSpace      = 8;
    CGFloat chartSpace       = 40;
    CGFloat largSpace        = 10;
    
    [self addSubview:expenLableTip];
    [self addSubview:balanceLable];
    [self addSubview:self.expenLable];
    [self addSubview:self.balanceLable];
    [self addSubview:self.typePieChart];

    
    [expenLableTip mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self).offset(largSpace);
        make.top.equalTo(self).offset(commonSpace);
        make.height.mas_equalTo(tipLableHeight);
        make.right.equalTo(self.mas_centerX);
    }];
    
    [balanceLable mas_makeConstraints:^(MASConstraintMaker *make) {
       @strongify(self);
        make.right.equalTo(self).offset(-largSpace);
        make.top.equalTo(self).offset(commonSpace);
        make.height.mas_equalTo(tipLableHeight);
        make.left.equalTo(self.mas_centerX);
    }];
    
    [self.expenLable mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(expenLableTip);
        make.left.equalTo(expenLableTip);
        make.right.equalTo(expenLableTip);
        make.top.equalTo(expenLableTip.mas_bottom).offset(commonSpace);
        make.height.mas_equalTo(valueLableHeight);
    }];
    
    [self.balanceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(balanceLable);
        make.left.equalTo(balanceLable);
        make.right.equalTo(balanceLable);
        make.top.equalTo(balanceLable.mas_bottom).offset(commonSpace);
        make.height.mas_equalTo(valueLableHeight);
    }];
    
    [self.typePieChart mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self).offset(chartSpace);
        make.right.equalTo(self).offset(-chartSpace);
        make.top.equalTo(self).offset(chartSpace);
        make.bottom.equalTo(self).offset(-chartSpace);
    }];
    
    
    [self.legendViewForChart mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.left.equalTo(self).offset(8);
        make.right.equalTo(self).offset(-8);
        make.bottom.equalTo(self).offset(-8);
        make.top.equalTo(self.typePieChart.mas_bottom).offset(8);
    }];

    
}

- (void)configureSignal
{
    @weakify(self);
    [[[RACObserve(self, viewModel) filter:^BOOL(id value) {
        return (value != nil);
    }]deliverOnMainThread]
     subscribeNext:^(id x) {
         @strongify(self);
         [self.legendViewForChart removeFromSuperview];
         self.legendViewForChart = [self.typePieChart getLegendWithMaxWidth:SCREEN_WIDTH - 8*2];
         
    }];
    
    [[RACObserve(self, viewModel.projectTypeArray) deliverOnMainThread]
     subscribeNext:^(NSArray *x) {
        @strongify(self);
        NSArray *itemArry = [MSChartDataItemAdapter pieCharDataArray:x];
        [self.typePieChart updateChartData:itemArry];
    }];
    
    

}


- (UILabel *)createTipLable
{
    UILabel *lable = [UILabel new];
    lable.font = [UIFont systemFontOfSize:14];
    lable.textColor = [UIColor darkGrayColor];
    return lable;
}


#pragma mark - Getter
- (UILabel *)expenLable
{
    if (!_expenLable) {
        _expenLable = [UILabel new];
        _expenLable.textAlignment = NSTextAlignmentLeft;
    }
    return _expenLable;
}

- (UILabel *)balanceLable
{
    if (!_balanceLable) {
        _balanceLable = [UILabel new];
        _balanceLable.textAlignment = NSTextAlignmentRight;
    }
    return _balanceLable;
}

- (PNPieChart *)typePieChart
{
    if (!_typePieChart) {
        CGFloat y = 8*3 + kListHeaderTopLableHeight*2;
        CGFloat radius = SCREEN_WIDTH * kRadiusOfTypePieChartScale;
        CGFloat x = (SCREEN_WIDTH - radius)/2.0;
        CGRect frame = CGRectMake(x, y, radius, radius);
        _typePieChart = [[PNPieChart alloc] initWithFrame:frame items:@[]];
    }
    return _typePieChart;
}



@end
