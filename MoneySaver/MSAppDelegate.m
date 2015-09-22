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


@interface MSAppDelegate ()

@end

@implementation MSAppDelegate


#pragma mark - Configure
- (void)venderConfigure
{
    [Bmob registerWithAppKey:kBmobSDKAPPKey];
}





#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self venderConfigure];

    { // 配置Windows
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        self.window.rootViewController = [UIViewController new];
        [self.window makeKeyAndVisible];
    }
    
    MSAccountViewModel *account = [MSAccountViewModel new];
    account.accountRequestModel.username = @"vfanx";
    account.accountRequestModel.password = @"666666";
    NSLog(@"%@",account.accountRequestModel);
    [[account.accountLoginCommand execute:nil] subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {}
- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationDidBecomeActive:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

@end
