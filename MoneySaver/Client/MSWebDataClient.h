//
//  WebDataClient.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>
#import "WebClientConstants.h"
#import "MSBmobObjectAdapter.h"

typedef NS_ENUM(NSUInteger, BmobObjectDataOperationType) {
    BmobObjectDataUpdate,
    BmobObjectDataDelete,
    BmobObjectDataInsert,
};

@interface MSWebDataClient : NSObject

/**
 *  调用云端代码
 *
 *  @param function   请求路径
 *  @param parameters 请求参数
 *
 *  @return 返回信号
 */
+ (RACSignal *)callFunctionInBackground:(NSString *)function
                         withParameters:(NSDictionary *)parameters;

/**
 *  调用云端代码
 *
 *  @param function   请求路径
 *  @param parameters 请求参数
 *  @param modelClass 响应模型
 *  @param isArray    是否未数组
 *
 *  @return 返回信号
 */
+ (RACSignal *)callFunctionInBackground:(NSString *)function
                         withParameters:(NSDictionary *)parameters
                             modelClass:(Class)modelClass
                                isArray:(BOOL)isArray;



/**
 *  更新数据库
 *
 *  @param model 需要更新的模型
 *  @param type  操作类型
 *
 *  @return 成功失败(成功返回@YES/失败返回Error)
 */
+ (RACSignal *)callDataOperationInBackground:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                        type:(BmobObjectDataOperationType)type;


/**
 *  缺省错误
 *
 *  @return 缺省错误
 */
+ (NSError *)defaultError;

@end
