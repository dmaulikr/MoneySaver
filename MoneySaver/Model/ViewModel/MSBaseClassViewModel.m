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

- (RACSignal *)updateToWebDatabaseWithModel:(MTLModel <MTLJSONSerializing> *)model
                                     new:(BOOL)isNew
{
    MSDataOperationType type = isNew?MSDataOperationInsert:MSDataOperationUpdate;
    return [MSWebDataClient callDataOperationInBackground:model type:type];
}

- (RACSignal *)updateToDatabaseWithModel:(MTLModel <MTLJSONSerializing> *)model
                                     new:(BOOL)isNew
{
    return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
        BOOL success = NO;
        if (isNew) {
           success = [(NSObject *)model saveToDB];
        } else {
            success = [(NSObject *)model updateToDB];
        }
        if (success) {
            [subscriber sendCompleted];
        } else {
            [subscriber sendError:nil];
        }
        return nil;
    }];
}


@end
