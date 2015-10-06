//
//  BaseClassViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"


@implementation MSBaseClassViewModel
@end



@implementation MSBaseDataViewModel


#pragma mark - Public Method
- (RACSignal *)updateData
{
    NSAssert(YES, @" \"- (RACSignal *)updateData\"  (此方法子类需要重写)");
    return [RACSignal empty];
}

- (RACSignal *)updateToWebDatabaseWithModel:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                     new:(BOOL)isNew
{
    MSDataOperationType type = isNew?MSDataOperationInsert:MSDataOperationUpdate;
    return [MSWebDataClient callDataOperationInBackground:model type:type];
}

- (RACSignal *)updateToDatabaseWithModel:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                  new:(BOOL)isNew
{
    MSDataOperationType type = isNew?MSDataOperationInsert:MSDataOperationUpdate;
    return [[MSSqliteDataBaseClient shareSqliteDataBaseClient] commonDataoperationWithModel:model type:type];
}


@end
