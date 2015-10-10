//
//  MSTestViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSTestViewController.h"
#import "MSNumberKeyBord.h"

#import <IQKeyboardManager.h>
#import "MoneySaverIconAnimate.h"

@interface MSTestViewController ()


@end

@implementation MSTestViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    [IQKeyboardManager sharedManager].enable = NO;
//    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
//     
//    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, CGRectGetWidth(self.view.bounds)-20, 80)];
//    textfield.borderStyle = UITextBorderStyleRoundedRect;
//    textfield.inputView = [[MSNumberKeyBord alloc] initWithTextField:textfield];
//    [self.view addSubview:textfield];
    
    MoneySaverIconAnimate *money = [[MoneySaverIconAnimate alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    money.center = self.view.center;
    [self.view addSubview:money];
    
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:money selector:@selector(addMoneyDropAnimation) userInfo:nil repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
