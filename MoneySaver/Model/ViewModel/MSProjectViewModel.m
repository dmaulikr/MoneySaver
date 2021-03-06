//
//  BaseProjectViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectViewModel.h"
#import "MSMoneySourceManagerViewModel.h"

@interface MSProjectViewModel ()

@property (nonatomic, strong) NSString *cacheSourceId;
@property (nonatomic, strong, readwrite) NSError *updataError;


@end


@implementation MSProjectViewModel
@synthesize updataError = _updataError;

#pragma mark - Life Cycle
+ (instancetype)projectWithModel:(MSBaseProjectModel *)model
{
    MSProjectViewModel *vm = [MSProjectViewModel new];
    vm.dataModel = model;
    return vm;
}


#pragma mark - Private Method
- (void)configureSignal
{
    @weakify(self);
    [[RACObserve(self, dataModel.sourceId) filter:^BOOL(id value) {
        @strongify(self);
        return (value != nil && self.cacheSourceId == nil);
    }] subscribeNext:^(id x) {
        @strongify(self);
        self.cacheSourceId = x;
    }];
}

#pragma mark - Getter
- (RACCommand *)updateCommand
{
    if (!_updateCommand) {
        @weakify(self);
        _updateCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [self updateData];
        }];
    }
    return _updateCommand;
}

#pragma mark - Rewrite Method

- (RACSignal *)updateData
{
    @weakify(self);
    RACSignal *localSignal = [self updateToDatabaseWithModel:self.dataModel new:self.isNewData];
    RACSignal *webSignal   = [self updateToWebDatabaseWithModel:self.dataModel new:self.isNewData];

    //更新ObjID
    [webSignal  doNext:^(BmobObject *x) {
        @strongify(self);
        self.dataModel.objectId = x.objectId;
    }];
    
    return [[[webSignal concat:localSignal] doCompleted:^{
        @strongify(self);
        if (self.isNewData) {
            self.newData = NO;
        }
        [self updateMoneySource];
    }] doError:^(NSError *error) {
        @strongify(self);
        self.updataError = error;
    }];
}

#pragma mark - Private Method
- (void)updateMoneySource
{
    if (self.cacheSourceId) {
        [[MSMoneySourceManagerViewModel shareManager] updateMoneySourceWithSourceId:self.cacheSourceId];
    }
    if (![self.cacheSourceId isEqual:self.dataModel.objectId]) {
        [[MSMoneySourceManagerViewModel shareManager] updateMoneySourceWithSourceId:self.dataModel.sourceId];
    }
    self.cacheSourceId = nil;
}


@end
