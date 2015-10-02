//
//  BaseProjectViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSBaseProjectModel.h"

@interface MSProjectViewModel : MSBaseClassViewModel

@property (nonatomic, strong) MSBaseProjectModel *dataModel;

@end
