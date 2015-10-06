//
//  BaseClassViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa.h>

#import "MSSqliteDataBaseClient.h"
#import "MSWebDataClient.h"
#import "MSBmobObjectAdapter.h"

#define ISNEWDATA(__objectId__) [__objectId__ isEqualToString:kNewDatabaseIdValue]


/**
 *  通用基类
 */
@interface MSBaseClassViewModel : NSObject
@end



/**
 *  数据基类
 */
@interface MSBaseDataViewModel : NSObject

- (RACSignal *)updateData;

- (RACSignal *)updateToWebDatabaseWithModel:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                        new:(BOOL)isNew;

- (RACSignal *)updateToDatabaseWithModel:(id <MTLJSONSerializing,MTLFMDBSerializing>)model
                                     new:(BOOL)isNew;

@end
