//
//  MSBaseClassDataModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassDataModel.h"
#import "DefaultConstants.h"


@implementation MSBaseClassDataModel
+ (NSDateFormatter *)getModelDateFormatter
{
    static NSDateFormatter *_modelDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_modelDateFormatter) {
            _modelDateFormatter = [NSDateFormatter new];
            _modelDateFormatter.dateFormat = @"YYYY-MM-DD hh:mm:ss";
        }
    });
    return _modelDateFormatter;
}

+ (LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper *_dataBaseHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_dataBaseHelper) {
            _dataBaseHelper = [[LKDBHelper alloc] initWithDBName:@"MoneySaver"];
            [_dataBaseHelper setEncryptionKey:kDatabaseEncryptKey];
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
    return kDefaultDatabaseId;
}

@end
