//
//  MoneySourceModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMoneySourceModel.h"

@implementation MSMoneySourceModel

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             kDefaultDatabaseId:kDefaultDatabaseId,
             @"sourceType":@"sourceType",
             @"sourceName":@"sourceName",
             @"total":@"total",
             };
}
@end
