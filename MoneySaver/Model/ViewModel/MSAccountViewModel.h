//
//  AccountViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSAccountDataModel.h"

@interface MSAccountViewModel : MSBaseClassViewModel

@property (nonatomic, strong) MSAccountRequestModel *accountRequestModel;
@property (nonatomic, strong) MSAccountDataModel    *dataModel;

@property (nonatomic, strong) NSError               *operationError;
@property (nonatomic, strong) NSError               *infomationError;

@property (nonatomic, strong) RACCommand            *loginCommand;
@property (nonatomic, strong) RACCommand            *logoutCommand;
@property (nonatomic, strong) RACCommand            *changePasswordCommand;
@property (nonatomic, strong) RACCommand            *forgetPasswordCommand;
@property (nonatomic, strong) RACCommand            *registerCommand;

@property (nonatomic, strong) UIImage               *userImage;

@end
