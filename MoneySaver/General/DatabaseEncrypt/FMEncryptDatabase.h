//
//  FMEncryptDatabase.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "FMDatabase.h"

@interface FMEncryptDatabase : FMDatabase

/** 如果需要自定义encryptkey，可以调用这个方法修改（在使用之前）*/
+ (void)setEncryptKey:(NSString *)encryptKey;


@end
