//
//  SqliteDataBaseClient.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLFMDBAdapter.h>
#import <ReactiveCocoa.h>
#import "MSBmobObjectAdapter.h"
#import "MSDataOperationType.h"

@interface MSSqliteDataBaseClient : NSObject

+ (instancetype)shareSqliteDataBaseClient;

- (RACSignal *)deleteAllDataFromDataBase;

- (RACSignal *)insertModel:(id<MTLFMDBSerializing>)model;

- (RACSignal *)deleteModel:(id<MTLFMDBSerializing>)model;

- (RACSignal *)updateModel:(id<MTLFMDBSerializing>)model;

- (RACSignal *)commonDataoperationWithModel:(id<MTLFMDBSerializing>)model
                                       type:(MSDataOperationType)type;


- (RACSignal *)selectModelsByClass:(Class)modelClass
                         tableName:(NSString *)name
                        condistion:(NSString *)condistion
                           isArray:(BOOL)isArray;

@end
