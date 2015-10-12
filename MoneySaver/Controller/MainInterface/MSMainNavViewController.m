//
//  MSMainViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/7.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSMainNavViewController.h"

@interface MSMainNavViewController ()

@end

@implementation MSMainNavViewController

#pragma mark - Life Cycle
- (instancetype)initWithViewModel:(id)viewmodel
{
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Rewrite Method
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - Private Method
- (void)configureViewController{}
- (void)layoutViewController{}
- (void)configureSignal{}



@end
