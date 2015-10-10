//
//  AppDelegate.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSAppDelegate.h"

#import "ConfigureConstants.h"


#import <BmobSDK/Bmob.h>
#import "MSAccountViewModel.h"

#import "UIColor+MoneySaver.h"
#import "MSLoginMainViewController.h"
#import "MSProjectEditorViewController.h"
#import "MSMainNavViewController.h"
#import "MSLaunchViewController.h"

#import "MSTestViewController.h"

@interface MSAppDelegate ()

@property (nonatomic, assign, getter=hadShowSecurityView) BOOL showSecurityView;
@property (nonatomic, strong) MSMainNavViewController *mainNavigation;
@property (nonatomic, strong) MSLaunchViewController  *launchController;

@end

@implementation MSAppDelegate

#pragma mark - Life Cycle
+ (instancetype)shareAppDelegate
{
    return (MSAppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - Configure
- (void)venderConfigure
{
    [Bmob registerWithAppKey:kBmobSDKAPPKey];
}

- (void)apperanceConfigure
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarTintColor:[UIColor ms_DefaultColor]];
    
}

- (void)configureViewController
{
    @weakify(self);
    MSProjectEditorViewController *editor = [MSProjectEditorViewController projectEditorViewControllerForMode:YES];
    self.mainNavigation = [[MSMainNavViewController alloc] initWithRootViewController:editor];
    MSLaunchViewController *launch = [[MSLaunchViewController alloc] initWithCompletionBlock:^{
        @strongify(self);
        self.window.rootViewController = self.mainNavigation;
    }];

    self.window.rootViewController = launch;
}



#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [MSLoginMainViewController new];
    [self.window makeKeyAndVisible];

    
    [self venderConfigure];
    [self apperanceConfigure];
    [self configureViewController];
    
    MSAccountViewModel *account = [MSAccountViewModel new];
    account.requestModel.username = @"vfanx";
    account.requestModel.password = @"666666";
    [[account.loginCommand execute:nil] subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
//
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    self.launchController = [MSLaunchViewController new];
//    self.launchController.
    [self.window.rootViewController presentViewController:self.launchController animated:YES completion:nil];
    self.showSecurityView = YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if (self.hadShowSecurityView) {
        [self.launchController dismissViewControllerAnimated:YES completion:nil];
        self.launchController = nil;
        self.showSecurityView = NO;
        
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

@end
