//
//  MSBaseClassViewController.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import <ReactiveCocoa.h>

@interface MSBaseClassViewController : UIViewController

- (instancetype)initWithViewModel:(id)viewmodel;

#pragma mark - Private Method
- (void)configureViewController;
- (void)layoutViewController;
- (void)configureSignal;



@end
