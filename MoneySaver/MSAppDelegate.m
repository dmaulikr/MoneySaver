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

#import "MSLoginMainViewController.h"
#import "MSTestViewController.h"

@interface MSAppDelegate ()

@end

@implementation MSAppDelegate

#pragma mark - Life Cycle
+ (instancetype)shareAppDelegate
{
    return [UIApplication sharedApplication].delegate;
}

#pragma mark - Configure
- (void)venderConfigure
{
    [Bmob registerWithAppKey:kBmobSDKAPPKey];
}

- (void)configureViewController
{
    self.window.rootViewController = [MSTestViewController new];
//    if ([BmobUser getCurrentUser]) {
//        
//    }else
//    {
        [self.window.rootViewController presentViewController:[MSLoginMainViewController new] animated:NO completion:nil];
//    }
}



#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [MSLoginMainViewController new];
    [self.window makeKeyAndVisible];

    
    [self venderConfigure];
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




- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

@end
