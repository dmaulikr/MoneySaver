//
//  BaseProjectModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseProjectModel.h"

@implementation MSBaseProjectModel


#pragma mark - Private Method
- (void)setProjectType:(MSProjectModelType)projectType
{
    _projectType = projectType;
    if (projectType == MSProjectModelIncomeType) {
        _transactionType = MSTransactionTypeIncome;
    }else
    {
        _transactionType = MSTransactionTypeOutlay;
    }
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"projectId":kDefaultDatabaseId,

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
    return [MSBaseProjectModel JSONKeyPathsByPropertyKey];
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[@"projectId"];
}

+ (NSString *)FMDBTableName
{
    return @"MSBaseProjectModel";
}


@end
