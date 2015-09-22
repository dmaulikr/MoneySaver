//
//  AccountDataModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "AccountDataModel.h"


@implementation AccountRequestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"account":@"account",
             @"password":@"password",
             @"email":@"email",
             };
}


@end

@implementation AccountDataModel


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"accountId":@"objectId",
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
    return [AccountDataModel JSONKeyPathsByPropertyKey];
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"account"];
}

+ (NSString *)FMDBTableName
{
    return @"AccountDataModel";
}

@end
