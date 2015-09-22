//
//  SqliteDataBaseClient.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLFMDBAdapter.h>

@interface MSSqliteDataBaseClient : NSObject

+ (instancetype)shareSqliteDataBaseClient;

- (void)deleteAllDataFromDataBase;

- (void)insertModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block;

- (void)deleteModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block;

- (void)updateModel:(id<MTLFMDBSerializing>)model
      callBackBlock:(void (^)(NSError *error,BOOL success))block;

- (void)selectModelsByClass:(Class)modelClass
                  tableName:(NSString *)name
                 condistion:(NSString *)condistion
                    isArray:(BOOL)isArray
              callBackBlock:(void (^)(id models,BOOL isArray))block;

@end
