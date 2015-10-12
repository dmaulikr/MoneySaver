//
//  MSProjectEditorViewController.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewController.h"
#import "MSProjectViewModel.h"

@interface MSProjectEditorViewController : MSBaseClassViewController


+ (instancetype)projectEditorViewControllerForQuickMode;
+ (instancetype)projectEditorViewControllerForModel:(MSProjectViewModel *)model;


@end
