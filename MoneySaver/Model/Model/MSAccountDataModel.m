//
//  AccountDataModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSAccountDataModel.h"


@implementation MSAccountRequestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"username":@"username",
             @"password":@"password",
             @"changePassword":@"changePassword",
             @"email":@"email",
             };
}


@end

@implementation MSAccountDataModel


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"accountId":kDefaultDatabaseId,
             @"account":@"account",
             @"token":@"token",
             @"monthLimit":@"monthLimit",
             @"userImage":@"userImage",
             @"backgroundImage":@"backgroundImage",
             };
}

#pragma mark - MTLFMDBSerializing

+ (NSDictionary *)FMDBColumnsByPropertyKey
{
    return [MSAccountDataModel JSONKeyPathsByPropertyKey];
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"account"];
}

+ (NSString *)FMDBTableName
{
    return @"MSAccountDataModel";
}

@end
