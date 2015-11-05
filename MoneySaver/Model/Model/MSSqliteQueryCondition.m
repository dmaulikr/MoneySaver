//
//  MSSqliteQueryCondition.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/6.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSqliteQueryCondition.h"



@implementation MSSqliteQueryCondition

- (NSString *)createQueryCondition
{
    NSMutableString *query = [NSMutableString new];
    NSMutableString *where = [NSMutableString stringWithString:@" "];
    BOOL whereNotNull = NO;
    if (self.likeName && self.likeValue) {
        [where appendFormat:@" %@ LIKE '%@' ",self.likeName,self.likeValue];
        whereNotNull = YES;
    }
    if (self.filterName && self.filterValue) {
        if (whereNotNull) {
            [where appendString:@" AND "];
        }
        whereNotNull = YES;
        if ([self.filterValue isKindOfClass:[NSNumber class]]) {
            [where  appendFormat:@" %@ NOT %@ ",self.filterName,self.filterValue];
        }else
        {
            [where  appendFormat:@" %@ NOT '%@' ",self.filterName,self.filterValue];
        }
    }
    
    if (whereNotNull) {
        [query appendString:where];
    }
    if (self.shortName) {
        [query appendFormat:@" ORDER BY %@ %@ ",self.shortName,self.shortDesc?@"DESC":@"ASC"];
    }
    return query;
}

@end
