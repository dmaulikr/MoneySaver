//
//  MSBaseClassViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewController.h"

@interface MSBaseClassViewController ()

@end

@implementation MSBaseClassViewController

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

#pragma mark - Private Method
- (void)configureViewController{}
- (void)layoutViewController{}
- (void)configureSignal{}


@end
