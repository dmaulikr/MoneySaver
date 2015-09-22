//
//  FMEncryptDatabaseQueue.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSEncryptDatabaseQueue.h"
#import "MSEncryptDatabase.h"

@implementation MSEncryptDatabaseQueue

+ (Class)databaseClass
{
    return [MSEncryptDatabase class];
}

@end
