//
//  UIDevice+XDevice.m
//  YiPaiHelper
//
//  Created by Tbxark on 15/8/7.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#import "UIDevice+XDevice.h"

#define kUIDeviceiPhone6pHeight     736.f
#define kUIDeviceiPhone6Height      667.f
#define kUIDeviceiPhone5Height      568.f
#define kUIDeviceiPhone4Height      480.f


static UIDeviceType _currentType = UIDeviceTypeUnkonw;

BOOL CGFlotEqual(CGFloat float1,CGFloat float2)
{
    return (fabs(float1 - float2) < CGFLOAT_MIN);
}


@implementation UIDevice (XDevice)

- (BOOL) isPad {
    return [self userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

- (BOOL) isLandscape {
    return UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]);
}

- (UIDeviceType)currentType
{
    if (_currentType != UIDeviceTypeUnkonw) {
        return _currentType;
    }
    if ([self isPad]) {
        _currentType = UIDeviceTypePad;
    }else
    {
        CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
        if (CGFlotEqual(height, kUIDeviceiPhone6pHeight))
        {
            _currentType = UIDeviceTypeiPhone6p;
        }else if (CGFlotEqual(height, kUIDeviceiPhone6Height))
        {
            _currentType = UIDeviceTypeiPhone6;
        }else if (CGFlotEqual(height, kUIDeviceiPhone5Height))
        {
            _currentType = UIDeviceTypeiPhone5;
        }else if(CGFlotEqual(height, kUIDeviceiPhone4Height))
        {
            _currentType = UIDeviceTypeiPhone4;
        }else
        {
            //默认iPhone5
            _currentType = UIDeviceTypeiPhone5;
        }
    }
    return _currentType;
}

@end
