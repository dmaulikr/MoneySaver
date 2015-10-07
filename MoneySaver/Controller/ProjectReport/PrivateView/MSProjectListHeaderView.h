//
//  MSProjectListHeaderView.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/27.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectManagerViewModel.h"

@interface MSProjectListHeaderView : UIView

@property (nonatomic, strong) MSProjectManagerViewModel *viewModel;

+ (instancetype)projectListHeaderView;

@end
