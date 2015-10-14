//
//  MoneySourceModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMoneySourceModel.h"

@implementation MSMoneySourceModel
@synthesize  objectId = _objectId;

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


//#pragma mark - Getter
//- (void)setObjectId:(NSString *)objectId
//{
//    _sourceId = objectId;
//}
//#pragma mark - Setter
//- (NSString *)objectId
//{
//    return _sourceId;
//}

@end
