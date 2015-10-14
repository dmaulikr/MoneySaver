//
//  MoneySourceViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMoneySourceViewModel.h"
#import "MSMoneySourceManagerViewModel.h"


@interface MSMoneySourceViewModel ()

@property (nonatomic, strong, readwrite) NSError *updataError;

@end

@implementation MSMoneySourceViewModel
@synthesize updataError = _updataError;

#pragma mark - Life Cycle
+ (instancetype)sourceWithModel:(MSMoneySourceModel *)model
{
    MSMoneySourceViewModel *vm = [MSMoneySourceViewModel new];
    vm.dataModel = model;
    return vm;
}

#pragma mark - Rewrite Method
- (RACSignal *)updateData
{
    @weakify(self);
    RACSignal *webSignal = [self updateToWebDatabaseWithModel:self.dataModel new:self.isNewData];
    RACSignal *localSignal = [self updateToDatabaseWithModel:self.dataModel new:self.isNewData];
    
    [webSignal doNext:^(BmobObject *x) {
       @strongify(self);
        self.dataModel.objectId = x.objectId;
    }];
    
    return [[[webSignal concat:localSignal] doCompleted:^{
        @strongify(self);
        if (self.isNewData) {
            self.newData = NO;
            [[[MSMoneySourceManagerViewModel shareManager] mutableArrayValueForKey:@"sourceArray"] addObject:self];
        }
    }] doError:^(NSError *error) {
        @strongify(self);
        self.updataError = error;
    }];
}

#pragma mark - Public Method
- (void)updateMoneySource
{
    
}



@end
