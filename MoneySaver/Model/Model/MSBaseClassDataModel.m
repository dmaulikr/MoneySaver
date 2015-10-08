//
//  MSBaseClassDataModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassDataModel.h"

@implementation MSBaseClassDataModel

#pragma mark - MTLJSONSerializing
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSAssert(NO, @"子类必须重写该方法");
    return nil;
}

#pragma mark - MTLFMDBSerializing

+ (NSDictionary *)FMDBColumnsByPropertyKey
{
    return [self JSONKeyPathsByPropertyKey];
}

+ (NSArray *)FMDBPrimaryKeys
{
    return @[kDefaultDatabaseId];
}

+ (NSString *)FMDBTableName
{
    return  NSStringFromClass([self class]);
}


@end
