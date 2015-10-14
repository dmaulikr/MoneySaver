//
//  MoneySourceManagerViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSMoneySourceViewModel.h"

@interface MSMoneySourceManagerViewModel : MSBaseClassViewModel

+ (instancetype)shareManager;

@property (nonatomic, strong) NSMutableArray <MSMoneySourceViewModel *> *sourceArray;

@property (nonatomic, strong , readonly) NSError *soureError;

- (void)updateMoneySourceWithSourceId:(NSString *)sourceId;

@end
