//
//  MSLaunchViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSLaunchViewController.h"
#import "MoneySaverIconAnimate.h"
#import <Masonry.h>
#import "UIView+XExplode.h"

@interface MSLaunchViewController ()

@property (nonatomic, strong) MoneySaverIconAnimate *icon;
@property (nonatomic, copy)   void (^completionBlock)(void);

@end

@implementation MSLaunchViewController

#pragma mark - Life Cycle
- (instancetype)initWithCompletionBlock:(void (^)(void))completionBlock
{
    self = [super init];
    if (self) {
        _completionBlock = completionBlock;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.icon resetBoomAnimateState];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    @weakify(self);
    [self.icon addMoneyDropAnimationCompletionBlock:^(BOOL finished) {
        @strongify(self);
        [self.icon boomAnimate:^(CFRunLoopTimerRef timer) {
            @strongify(self);
            if (self.completionBlock) {
                dispatch_async(dispatch_get_main_queue(), self.completionBlock);
            }
        }];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)configureViewController
{
    [self.view addSubview:self.icon];
}

#pragma mark -Getter
- (MoneySaverIconAnimate *)icon
{
    if (!_icon) {
        _icon = [[MoneySaverIconAnimate alloc] initWithFrame:CGRectMake(0, 0, 100, 130)];
        _icon.center = self.view.center;
    }
    return _icon;
}


@end
