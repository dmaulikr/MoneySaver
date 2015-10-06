//
//  MoneySourceViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMoneySourceViewModel.h"

@interface MSMoneySourceViewModel ()

@end

@implementation MSMoneySourceViewModel

#pragma mark - Life Cycle
+ (instancetype)sourceWithModel:(MSMoneySourceModel *)model
{
    MSMoneySourceViewModel *vm = [MSMoneySourceViewModel new];
    vm.dataModel = model;
    return vm;
}

#pragma mark - Public Method
- (void)updateMoneySource
{
    
}



@end
