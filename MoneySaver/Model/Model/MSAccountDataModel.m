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
@synthesize objectId = _objectId;


#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             kDefaultDatabaseId:kDefaultDatabaseId,
             @"account":@"account",
             @"token":@"token",
             @"monthLimit":@"monthLimit",
             @"userImage":@"userImage",
             @"backgroundImage":@"backgroundImage",
             };
}


//#pragma mark - Getter
//- (void)setObjectId:(NSString *)objectId
//{
//    _accountId = objectId;
//}
//
//#pragma mark - Setter
//- (NSString *)objectId
//{
//    return _accountId;
//}

@end
