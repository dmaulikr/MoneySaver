//
//  SqliteDataBaseClientSaver.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SqliteDataBaseClientSaver <NSObject>


/**
 *  读取缓存
 */
- (void)selectFromSqliteDataBase;

/**
 *  保存到数据库
 *
 *  @return 成功/失败
 */
- (BOOL)saveToSqliteDataBase;

/**
 *  更新数据库
 *
 *  @return 成功/失败
 */
- (BOOL)updateToSqliteDatabase;

/**
 *  重数据库删除
 *
 *  @return 成功/失败
 */
- (BOOL)deleteFromSqliteDatabase;

@end
