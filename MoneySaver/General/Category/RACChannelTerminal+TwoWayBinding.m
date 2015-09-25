//
//  RACChannelTerminal+TwoWayBinding.m
//  YiPaiHelper
//
//  Created by Tbxark on 15/7/18.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import "RACChannelTerminal+TwoWayBinding.h"

@implementation RACChannelTerminal (TwoWayBinding)

+ (void)twoWayBindingForChannel1:(RACChannelTerminal *)channel1 andChannel2:(RACChannelTerminal *)channel2;
{
    [channel1 subscribe:channel2];
    [channel2 subscribe:channel1];
}


@end
