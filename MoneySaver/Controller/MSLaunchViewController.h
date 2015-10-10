//
//  MSLaunchViewController.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewController.h"

@interface MSLaunchViewController : MSBaseClassViewController

- (instancetype)initWithCompletionBlock:(void (^)(void))completionBlock;

@end
