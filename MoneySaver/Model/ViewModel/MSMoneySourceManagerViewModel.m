//
//  MoneySourceManagerViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMoneySourceManagerViewModel.h"
#import "MSMoneySourceViewModel.h"


@interface MSMoneySourceManagerViewModel ()


@end

@implementation MSMoneySourceManagerViewModel

#pragma mark - Life Cycle
+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    static MSMoneySourceManagerViewModel *_shareManager;
    dispatch_once(&onceToken, ^{
        if (_shareManager == nil) {
            _shareManager = [MSMoneySourceManagerViewModel new];
        }
    });
    return _shareManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self updateMoneySource];
    }
    return self;
}

#pragma mark - Public Method
- (void)updateMoneySourceWithSourceId:(NSString *)sourceId
{
    for (MSMoneySourceViewModel *vm in self.sourceArray) {
        if ([vm.dataModel.objectId isEqual:sourceId]) {
            [vm updateMoneySource];
            break;
        }
    }
}


#pragma mark - Private Method
- (void)updateMoneySource
{
//    @weakify(self);
//    [[[MSSqliteDataBaseClient shareSqliteDataBaseClient] selectModelsByClass:[MSMoneySourceModel class] tableName:[MSMoneySourceModel FMDBTableName] condistion:nil isArray:YES] subscribeNext:^(NSArray *x) {
//        @strongify(self);
//        [self.sourceArray removeAllObjects];
//        for (MSMoneySourceModel *model in x) {
//            MSMoneySourceViewModel *vm = [MSMoneySourceViewModel new];
//            vm.dataModel = model;
//            [self.sourceArray addObject:vm];
//        }
//    } error:^(NSError *error) {
//        @strongify(self);
//        self.soureError = error;
//    }];
}


#pragma mark - Getter
- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        _sourceArray = [NSMutableArray new];
    }
    return _sourceArray;
}


@end
