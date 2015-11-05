//
//  MTLModel+MSDataBase.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/14.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MTLModel+MSDataBase.h"
#import "DefaultConstants.h"


@implementation MTLModel (MSDataBase)

+ (NSDateFormatter *)getModelDateFormatter
{
    static NSDateFormatter *_modelDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_modelDateFormatter) {
            _modelDateFormatter = [NSDateFormatter new];
            _modelDateFormatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
        }
    });
    return _modelDateFormatter;
}

+ (LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper *_dataBaseHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_dataBaseHelper) {
            _dataBaseHelper = [[LKDBHelper alloc] initWithDBName:@"MoneySaver"];
#warning Block database encryption function and then in the Release version remember to open
//TODO:屏蔽了数据库加密,在 Release 版本中记得打开
//            [_dataBaseHelper setEncryptionKey:kDatabaseEncryptKey];
        }
    });
    return   _dataBaseHelper;
    
}

+ (NSString *)getTableName
{
    return NSStringFromClass([self class]);
}

+ (NSString *)getPrimaryKey
{
    return @"objectId";
}


+ (NSError *)databaseLastError
{
    __block NSError *error = nil;
    [[self getUsingLKDBHelper] executeDB:^(FMDatabase *db) {
        error = db.lastError;
    }];
    return error;
}
@end
