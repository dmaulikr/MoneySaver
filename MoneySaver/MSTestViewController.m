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

@interface MSTestViewController ()


@end

@implementation MSTestViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
     
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, CGRectGetWidth(self.view.bounds)-20, 30)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.inputView = [[MSNumberKeyBord alloc] initWithTextField:textfield];
    [self.view addSubview:textfield];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
