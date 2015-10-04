//
//  MSSecurityField.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/4.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSSecurityField : UITextField

@property (nonatomic, strong) UIColor *filedColor;
@property (nonatomic, assign) NSInteger numOfPassword;
@property (nonatomic, copy)   NSString *charForPassword;

@end
