//
//  MSGlobalPropertyContainer.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/4.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSGlobalPropertyContainer.h"

@implementation MSGlobalPropertyContainer

static MSGlobalPropertyContainer *kMSGlobalPropertyContainer = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        kMSGlobalPropertyContainer = [[super allocWithZone:NULL] init];
    });
    
    return kMSGlobalPropertyContainer;
}

#pragma mark - Life Cycle

+ (instancetype) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (instancetype)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (instancetype)copy
{
    return [[MSGlobalPropertyContainer alloc] init];
}

- (instancetype)mutableCopy
{
    return [[MSGlobalPropertyContainer alloc] init];
}

- (instancetype) init
{
    if(kMSGlobalPropertyContainer){
        return kMSGlobalPropertyContainer;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
