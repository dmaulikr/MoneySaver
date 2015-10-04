//
//  MSProjectValueHeaderView.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/3.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectViewModel.h"


#define kMSProjectValueHeaderViewHeight (SCREEN_WIDTH/4.0)

@interface MSProjectValueHeaderView : UIView

@property (nonatomic, strong, readonly) UITextField *valueFiled;
@property (nonatomic, strong) MSProjectViewModel *viewModel;

+ (instancetype)projectValueHeaderView;

@end
