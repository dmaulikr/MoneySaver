//
//  NSDictionary+DeleteNull.m
//  YiPaiHelper
//
//  Created by Tbxark on 15/9/30.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "NSDictionary+DeleteNull.h"

@implementation NSDictionary (DeleteNull)

- (NSDictionary *)deleteNullValue
{
    NSMutableArray *keyArray = [NSMutableArray new];
    NSMutableDictionary *changeDict = [NSMutableDictionary new];
    NSMutableDictionary *dict = [NSMutableDictionary new];
    for (NSString *key in self) {
        id value = self[key];
        if ([value isKindOfClass:[NSDictionary class]]) {
            [changeDict setValue:[value deleteNullValue] forKey:key];
        }else if (value == [NSNull null])
        {
            [keyArray addObject:key];
        }
    }
    [dict setDictionary:self];
    [dict setValuesForKeysWithDictionary:changeDict];
    [dict removeObjectsForKeys:keyArray];
    return dict;
}

@end
