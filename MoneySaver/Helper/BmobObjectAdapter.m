//
//  BmobObjectAdapter.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "BmobObjectAdapter.h"
#import <BmobACL.h>
#import <BmobUser.h>


@implementation BmobObjectAdapter

+ (BmobObject *)bmobObjectFromModel:(id <MTLJSONSerializing,MTLFMDBSerializing>)model error:(NSError **)error
{
    BmobObject *object = [BmobObject new];
    NSDictionary *dict = [MTLJSONAdapter JSONDictionaryFromModel:model error:error];
    
    //设置数值
    for (NSString *key in dict) {
        [object setObject:dict[key] forKey:key];
    }
    
    //设置用户指针
    BmobUser *user = [BmobUser getCurrentUser];
    if (error && user == nil) {
        return nil;
    }
    [object setObject:[BmobUser getCurrentUser] forKey:@"account"];
    object.className = [[(NSObject *)model class] FMDBTableName];
    
    
    //设置权限
    BmobACL *acl = [BmobACL ACL];
    [acl setReadAccessForUser:user];//设置只有当前用户可读
    [acl setWriteAccessForUser:user];//设置只有当前用户可写
    object.ACL= acl;
    
    return object;
}

@end
