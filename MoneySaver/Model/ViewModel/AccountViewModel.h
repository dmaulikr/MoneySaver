//
//  AccountViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "BaseClassViewModel.h"
#import "AccountDataModel.h"

@interface AccountViewModel : BaseClassViewModel

@property (nonatomic, strong) AccountRequestModel *accountRequestModel;
@property (nonatomic, strong) AccountDataModel *accountDataModel;

@property (nonatomic, strong) NSError *commandError;

@property (nonatomic, strong) RACCommand *accountLoginCommand;
@property (nonatomic, strong) RACCommand *changePasswordCommand;
@property (nonatomic, strong) RACCommand *forgetPasswordCommand;
@property (nonatomic, strong) RACCommand *registerCommand;

@end
