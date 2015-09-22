//
//  BaseProjectModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "BaseProjectModel.h"

@implementation BaseProjectModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"projectId":@"projectId",

             @"transactionType":@"transactionType",
             @"projectType":@"projectType",

             @"date":@"date",
             @"name":@"name",
             @"value":@"value",
             @"note":@"note",
             
             @"sourceId":@"sourceId",
             };
}

#pragma mark - MTLFMDBSerializing

+ (NSDictionary *)FMDBColumnsByPropertyKey
{
    return [BaseProjectModel JSONKeyPathsByPropertyKey];
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"projectId"];
}

+ (NSString *)FMDBTableName
{
    return @"BaseProjectModel";
}


@end
