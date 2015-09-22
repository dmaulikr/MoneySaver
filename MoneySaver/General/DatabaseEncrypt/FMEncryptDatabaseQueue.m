//
//  FMEncryptDatabaseQueue.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "FMEncryptDatabaseQueue.h"
#import "FMEncryptDatabase.h"

@implementation FMEncryptDatabaseQueue

+ (Class)databaseClass
{
    return [FMEncryptDatabase class];
}

@end
