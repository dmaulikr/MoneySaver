//
//  MSWebDateSyncClient.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/6.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSWebDataClient.h"

@interface MSWebDateSyncClient : NSObject

@property (nonatomic, copy) NSString *syncState;
- (void)sync;

@end
