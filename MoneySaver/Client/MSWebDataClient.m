//
//  WebDataClient.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSWebDataClient.h"
#import <Bmob.h>
#import <Mantle.h>

@implementation MSWebDataClient

+ (RACSignal *)callFunctionInBackground:(NSString *)function withParameters:(NSDictionary *)parameters
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [BmobCloud callFunctionInBackground:function
                             withParameters:parameters
                                      block:^(id object, NSError *error) {
            if (error) {
                [subscriber sendError:error];
            }else if (object)
            {
                if ([object isKindOfClass:[NSDictionary class]]) {
                    NSInteger stateCode = [[object  objectForKey:kNetResponeStateCode] integerValue];
                    if (stateCode == kNetResponeSuccessCode) {
                        [subscriber sendNext:[object objectForKey:kNetResponeResultKey]];
                        [subscriber sendCompleted];
                    }else
                    {
                        NSString *errorReason = [object objectForKey:kNetResponeErrorKey]?:kNetErrorUserInfoDefautValue;
                        NSError *error = [NSError errorWithDomain:kNetDefaultErrorDomain
                                                             code:stateCode
                                                         userInfo:@{kNetErrorUserInfoReasonkey:errorReason}];
                        [subscriber sendError:error];
                    }
                }else
                {
                    [subscriber sendError:[MSWebDataClient defaultError]];
                }
            }else
            {
                [subscriber sendError:[MSWebDataClient defaultError]];
            }
        }];
        return nil;
    }] replayLazily];
}


+ (RACSignal *)callFunctionInBackground:(NSString *)function
                         withParameters:(NSDictionary *)parameters
                             modelClass:(Class)modelClass
                                isArray:(BOOL)isArray
{
    return [[MSWebDataClient callFunctionInBackground:function
                                      withParameters:parameters] flattenMap:^RACStream *(id value) {
        NSError *error;
        id respone;
        if (isArray) {
            respone = [MTLJSONAdapter modelOfClass:modelClass
                                fromJSONDictionary:value
                                             error:&error];
        } else {
            respone = [MTLJSONAdapter modelsOfClass:modelClass
                                      fromJSONArray:value
                                              error:&error];
        }
        if (error) {
            return [RACSignal error:error];
        } else {
            return [RACSignal return:respone];
        }
    }];
}


+ (RACSignal *)callDataOperationInBackground:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                        type:(BmobObjectDataOperationType)type
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSError *error;
        BmobObject *object = [MSBmobObjectAdapter bmobObjectFromModel:model
                                                                error:&error];
        if (error) {
            [subscriber sendError:error];
        } else {
            BmobBooleanResultBlock block =  ^(BOOL isSuccessful, NSError *error){
                if (isSuccessful) {
                    if (error) {
                        [subscriber sendError:error];
                    } else {
                        [subscriber sendError:[MSWebDataClient defaultError]];
                    }
                } else {
                    [subscriber sendNext:@(isSuccessful)];
                    [subscriber sendCompleted];
                }
            };
            switch (type) {
                case BmobObjectDataDelete:
                    [object deleteInBackgroundWithBlock:block];
                    break;
                case BmobObjectDataInsert:
                    [object saveInBackgroundWithResultBlock:block];
                    break;
                case BmobObjectDataUpdate:
                    [object updateInBackgroundWithResultBlock:block];
                    break;
                default:
                    [subscriber sendError:[MSWebDataClient defaultError]];
                    break;
            }
        }
        return nil;
    }];
}



+ (NSError *)defaultError
{

    NSError *defaultError = [NSError errorWithDomain:kNetDefaultErrorDomain
                                                code:kNetResponeDefaultErrorCode
                                            userInfo:@{kNetErrorUserInfoReasonkey:kNetErrorUserInfoDefautValue}];
    return defaultError;
}


@end
