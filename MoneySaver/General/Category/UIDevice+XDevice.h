//
//  UIDevice+XDevice.h
//  YiPaiHelper
//
//  Created by Tbxark on 15/8/7.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIDeviceType) {
    UIDeviceTypeUnkonw,
    UIDeviceTypePad,
    UIDeviceTypeiPhone4,
    UIDeviceTypeiPhone5,
    UIDeviceTypeiPhone6,
    UIDeviceTypeiPhone6p,
};

@interface UIDevice (XDevice)

- (BOOL) isPad;
- (BOOL) isLandscape;

- (UIDeviceType)currentType;

@end
