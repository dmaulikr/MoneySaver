//
//  MSNumberKeyBordButton.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/25.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MSNumberKeyBordButtonType) {
    MSNumberKeyBordZeroButton        = 0,
    MSNumberKeyBordOneButtonType,
    MSNumberKeyBordTwoButtonType,
    MSNumberKeyBordFourButtonType,
    MSNumberKeyBordFiveButtonType,
    MSNumberKeyBordSixButtonType,
    MSNumberKeyBordSevenButtonType,
    MSNumberKeyBordEightButtonType,
    MSNumberKeyBordNightButtonType,
    
    MSNumberKeyBordPointButtonType   = 10,
    MSNumberKeyBordAddButtonType     = 11,
    MSNumberKeyBordDeleteButtonType  = 12,

    MSNumberKeyBordCommiteButtonType = 13,
};

FOUNDATION_EXPORT NSString *MSNumberKeyBordButtonTypeToString(MSNumberKeyBordButtonType type);

@interface MSNumberKeyBordButton : UIButton

@property (nonatomic, assign) MSNumberKeyBordButtonType type;

+ (instancetype)buttonWithType:(MSNumberKeyBordButtonType)type;
- (instancetype)initWithType:(MSNumberKeyBordButtonType)type;

@end
