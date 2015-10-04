//
//  MSNumberKeyBord.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/25.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMSNumberKeyBordHeight 240

@interface MSNumberKeyBord : UIView

@property (nonatomic, strong) NSString *inputString;
@property (nonatomic, copy)   void(^inputComplete)(NSString *inputString);

- (instancetype)initWithTextField:(UITextField *)textField;

@end
