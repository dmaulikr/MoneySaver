//
//  Macro.h
//  BetterOne
//
//  Created by Tbxark on 15/6/24.
//  Copyright (c) 2015年 TBXark. All rights reserved.
//

#ifndef BetterOne_Macro_h
#define BetterOne_Macro_h



// iOS系统版本
#define SYSTEM_VERSION    [[[UIDevice currentDevice] systemVersion] doubleValue]
// 标准系统状态栏高度
#define SYS_STATUSBAR_HEIGHT                                        20
// 热点栏高度
#define HOTSPOT_STATUSBAR_HEIGHT                                    20
// 导航栏（UINavigationController.UINavigationBar）高度
#define NAVIGATIONBAR_HEIGHT                                        44
// 工具栏（UINavigationController.UIToolbar）高度
#define TOOLBAR_HEIGHT                                              44
// 标签栏（UITabBarController.UITabBar）高度
#define TABBAR_HEIGHT                                               44
// APP_STATUSBAR_HEIGHT=SYS_STATUSBAR_HEIGHT+[HOTSPOT_STATUSBAR_HEIGHT]
#define APP_STATUSBAR_HEIGHT                         (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
// 根据APP_STATUSBAR_HEIGHT判断是否存在热点栏
#define IS_HOTSPOT_CONNECTED                         (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?YES:NO)
// 无热点栏时，标准系统状态栏高度+导航栏高度
#define NORMAL_STATUS_AND_NAV_BAR_HEIGHT             (SYS_STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)
// 实时系统状态栏高度+导航栏高度，如有热点栏，其高度包含在APP_STATUSBAR_HEIGHT中。
#define STATUS_AND_NAV_BAR_HEIGHT                    (APP_STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)

//屏幕高度
#define SCREEN_HEIGHT                                ([UIScreen mainScreen].bounds.size.height)

//屏幕宽度
#define SCREEN_WIDTH                                 ([UIScreen mainScreen].bounds.size.width)


#endif
