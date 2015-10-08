//
//  AccountViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSAccountDataModel.h"

#define kMinUserNameLength 5
#define kMaxUserNameLength 20
#define kMinPasswordLength 6
#define kMaxPasswordLength 30


@interface MSAccountViewModel : MSBaseDataViewModel

//模型
@property (nonatomic, strong) MSAccountRequestModel *requestModel;
@property (nonatomic, strong) MSAccountDataModel    *dataModel;

//错误
@property (nonatomic, strong) NSError               *operationError;
@property (nonatomic, strong) NSError               *infomationError;

//命令
@property (nonatomic, strong) RACCommand            *loginCommand;
@property (nonatomic, strong) RACCommand            *logoutCommand;
@property (nonatomic, strong) RACCommand            *changePasswordCommand;
@property (nonatomic, strong) RACCommand            *forgetPasswordCommand;
@property (nonatomic, strong) RACCommand            *registerCommand;

//字符串检查
@property (nonatomic, strong) RACSignal *emailEnable;
@property (nonatomic, strong) RACSignal *accountEnable;
@property (nonatomic, strong) RACSignal *passwordEnable;

//头像
@property (nonatomic, strong) UIImage               *userImage;

@end
