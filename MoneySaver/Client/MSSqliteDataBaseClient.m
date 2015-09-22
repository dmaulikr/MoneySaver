//
//  SqliteDataBaseClient.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSqliteDataBaseClient.h"
#import "MSEncryptDatabaseQueue.h"

static MSSqliteDataBaseClient *_defaultDataBaseClient;

@interface MSSqliteDataBaseClient ()

@property (nonatomic, strong) MSEncryptDatabaseQueue *queue;

@end

@implementation MSSqliteDataBaseClient

#pragma mark - Init

+ (instancetype)shareSqliteDataBaseClient
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_defaultDataBaseClient) {
            _defaultDataBaseClient = [MSSqliteDataBaseClient new];
        }
    });
    return _defaultDataBaseClient;
}

+ (NSString *)dataBasePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [path stringByAppendingString:@"moneysaver.sqlite"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [MSEncryptDatabaseQueue databaseQueueWithPath:[MSSqliteDataBaseClient dataBasePath]];
    }
    return self;
}

#pragma mark - Data Operation
- (void)insertModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block
{
    NSString *stmt = [MTLFMDBAdapter insertStatementForModel:model];
    NSArray *params = [MTLFMDBAdapter columnValues:model];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL result = NO;
        if (params && params.count > 0) {
            result = [db executeUpdate:stmt withArgumentsInArray:params];
        } else {
            result = [db executeUpdate:stmt];
        }

        if (result) {
            block(nil,YES);
        } else {
            block(db.lastError,NO);
        }
    }];
}

- (void)deleteModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block

{
    NSString *stmt = [MTLFMDBAdapter deleteStatementForModel:model];
    NSArray *params = [MTLFMDBAdapter columnValues:model];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL result = NO;

        if (params && params.count > 0) {
            result = [db executeUpdate:stmt withArgumentsInArray:params];
        } else {
            result = [db executeUpdate:stmt];
        }
        
        if (result) {
            block(nil,YES);
        } else {
            block(db.lastError,NO);
        }
    }];
}

- (void)updateModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block

{
    NSString *stmt = [MTLFMDBAdapter updateStatementForModel:model];
    NSArray *params = [MTLFMDBAdapter columnValues:model];
    [_queue inDatabase:^(FMDatabase *db) {
        BOOL result = NO;

        if (params && params.count > 0) {
            result = [db executeUpdate:stmt withArgumentsInArray:params];
        } else {
            result = [db executeUpdate:stmt];
        }
        
        if (result) {
            block(nil,YES);
        } else {
            block(db.lastError,NO);
        }
    }];
}

- (void)selectModelsByClass:(Class)modelClass
                  tableName:(NSString *)name
                 condistion:(NSString *)condistion
                    isArray:(BOOL)isArray
              callBackBlock:(void (^)(id models,BOOL isArray))block
{
    NSString *stmt;
    NSParameterAssert(name != nil);
    if (condistion) {
        stmt = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@;",name,condistion];
    } else {
        stmt = [NSString stringWithFormat:@"SELECT * FROM %@;",name];
    }
    
    [_queue inDatabase:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:stmt];
        NSError *error;
        if (isArray) {
            if ([resultSet next]) {
                id result = [MTLFMDBAdapter modelOfClass:modelClass fromFMResultSet:resultSet error:&error];
                block(result,NO);
            }
        } else {
            NSMutableArray *muArray = [NSMutableArray new];
            while ([resultSet next]) {
                id result = [MTLFMDBAdapter modelOfClass:modelClass fromFMResultSet:resultSet error:&error];
                [muArray addObject:result];
            }
            block(muArray,YES);
        }
    }];
}


@end
