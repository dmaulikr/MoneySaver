//
//  SqliteDataBaseClient.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSSqliteDataBaseClient.h"
#import "MSEncryptDatabaseQueue.h"
#import "WebClientConstants.h"

static MSSqliteDataBaseClient *_defaultDataBaseClient;

static NSString *kSqliteCreaterFileName  = @"SqliteCreaterV1.0.0";
static NSString *kSqliteCleanerFileName  = @"SqliteCleanerV1.0.0";
static NSString *kSqliteDataBaseFileName = @"MoneySaverV1.0.0.sqlite";

static NSString *kDataBaseErrorDomane  = @"com.TBXark.MoneySaver.DatabaseError";

@interface MSSqliteDataBaseClient ()

@property (nonatomic, strong) MSEncryptDatabaseQueue *queue;

@end

@implementation MSSqliteDataBaseClient

#pragma mark - Life Cycle

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
    return [path stringByAppendingFormat:@"/%@",kSqliteDataBaseFileName];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [MSEncryptDatabaseQueue databaseQueueWithPath:[MSSqliteDataBaseClient dataBasePath]];
        [self createTable];
    }
    return self;
}

#pragma mark - Table Operation
- (BOOL)createTable
{
    __block BOOL success = NO;
    [_queue inDatabase:^(FMDatabase *db) {
        NSError *error;
        NSString *createrPath = [[NSBundle mainBundle] pathForResource:kSqliteCreaterFileName ofType:@"sql"];
        NSString *createrSQL  = [NSString stringWithContentsOfFile:createrPath encoding:NSUTF8StringEncoding error:&error];
        if (error == nil) {
            success = [db executeQuery:createrSQL];
        }
    }];
    return success;
}

- (BOOL)dropAllTable
{
    return NO;
}



#pragma mark - Data Operation
- (RACSignal *)commonDataoperationWithModel:(id<MTLFMDBSerializing>)model
                                       type:(MSDataOperationType)type
{
    if (model == nil) {
        return [RACSignal error:[NSError errorWithDomain:kDataBaseErrorDomane
                                                    code:0
                                                userInfo:@{kNetResponeErrorKey:@"数据为空"}]];
    }
    switch (type) {
        case MSDataOperationInsert:return [self insertModel:model];
        case MSDataOperationUpdate:return [self updateModel:model];
        case MSDataOperationDelete:return [self deleteModel:model];
        default:
            return [RACSignal error:[NSError errorWithDomain:kDataBaseErrorDomane
                                                        code:0
                                                    userInfo:@{kNetResponeErrorKey:@"暂不支持操作"}]];
                        break;
    }
}


- (RACSignal *)insertModel:(id<MTLFMDBSerializing>)model
{
    NSString *stmt = [MTLFMDBAdapter insertStatementForModel:model];
    NSArray *params = [MTLFMDBAdapter columnValues:model];
    return [self executeUpdate:stmt withArgumentsInArray:params];
}

- (RACSignal *)deleteModel:(id<MTLFMDBSerializing>)model

{
    NSString *stmt = [MTLFMDBAdapter deleteStatementForModel:model];
    NSArray *params = [MTLFMDBAdapter columnValues:model];
    return [self executeUpdate:stmt withArgumentsInArray:params];
}

- (RACSignal *)updateModel:(id<MTLFMDBSerializing>)model

{
    NSString *stmt = [MTLFMDBAdapter updateStatementForModel:model];
    NSArray  *params = [MTLFMDBAdapter columnValues:model];
    return [self executeUpdate:stmt withArgumentsInArray:params];
}


- (RACSignal *)executeUpdate:(NSString *)stmt withArgumentsInArray:(NSArray *)params
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.queue inDatabase:^(FMDatabase *db) {
            BOOL result = NO;
            if (params && params.count > 0) {
                result = [db executeUpdate:stmt withArgumentsInArray:params];
            } else {
                result = [db executeUpdate:stmt];
            }
            
            if (result) {
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
            } else {
                [subscriber sendError:db.lastError];
            }
        }];
        return nil;
    }];
}


- (RACSignal *)selectModelsByClass:(Class)modelClass
                         tableName:(NSString *)name
                        condistion:(NSString *)condistion
                           isArray:(BOOL)isArray
{
    NSString *tableName = NSStringFromClass(modelClass);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *stmt;
        NSParameterAssert(name != nil);
        if (condistion) {
            stmt = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@;",name,condistion];
        } else {
            stmt = [NSString stringWithFormat:@"SELECT * FROM %@;",name];
        }
        
        [self.queue inDatabase:^(FMDatabase *db) {
            FMResultSet *resultSet = [db executeQuery:stmt];
            NSError *error = nil;
            id result;
            if (isArray) {
                if ([resultSet next]) {
                    result = [MTLFMDBAdapter modelOfClass:modelClass fromFMResultSet:resultSet error:&error];
                    
                }
            } else {
                NSMutableArray *muArray = [NSMutableArray new];
                while ([resultSet next]) {
                    result = [MTLFMDBAdapter modelOfClass:modelClass fromFMResultSet:resultSet error:&error];
                    [muArray addObject:result];
                }
                result = muArray;
            }
            if (result && error == nil) {
                [subscriber sendNext:result];
                [subscriber sendCompleted];
            }else
            {
                [subscriber sendError:error];
            }
            
        }];
        return nil;
    }];
}

- (RACSignal *)deleteAllDataFromDataBase
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.queue inDatabase:^(FMDatabase *db) {
            NSError *error;
            NSString *createrPath = [[NSBundle mainBundle] pathForResource:kSqliteCleanerFileName ofType:@"sql"];
            NSString *createrSQL  = [NSString stringWithContentsOfFile:createrPath encoding:NSUTF8StringEncoding error:&error];
            BOOL success = NO;
            if (error == nil) {
                success = [db executeQuery:createrSQL];
            }
            
            if (error || ! success) {
                [subscriber sendError:error];
            }else
            {
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
            }
            
        }];
        return nil;
    }];
}



@end
