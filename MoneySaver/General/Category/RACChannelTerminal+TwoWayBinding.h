//
//  RACChannelTerminal+TwoWayBinding.h
//  YiPaiHelper
//
//  Created by Tbxark on 15/7/18.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import "RACChannel.h"

#define RAC_Binding(channel1,channel2) [RACChannelTerminal twoWayBindingForChannel1:(channel1) andChannel2:(channel2)]

@interface RACChannelTerminal (TwoWayBinding)

+ (void)twoWayBindingForChannel1:(RACChannelTerminal *)channel1 andChannel2:(RACChannelTerminal *)channel2;

@end
