//
//  AccountViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSAccountViewModel.h"
#import <BmobUser.h>
#import "NSString+XValueCheck.h"



@interface MSAccountViewModel ()



@end

@implementation MSAccountViewModel


- (void)configureSignal
{
}


#pragma mark - Getter


- (MSAccountRequestModel *)requestModel
{
    if (!_requestModel) {
        _requestModel = [MSAccountRequestModel new];
    }
    return _requestModel;
}


- (RACSignal *)accountEnable
{
    if (!_accountEnable) {
        RACSignal *username =RACObserve(self, requestModel.username);
        _accountEnable = [username map:^id(id value) {
            return @([value isValidWithMinLenth:kMinUserNameLength
                                       maxLenth:kMaxUserNameLength
                                 containChinese:NO
                            firstCannotBeDigtal:NO]);
        }];
    }
    return _accountEnable;
}

- (RACSignal *)passwordEnable
{
    if (!_passwordEnable) {
        RACSignal *password = RACObserve(self, requestModel.username);
        _passwordEnable = [password map:^id(id value) {
            return @([value isValidWithMinLenth:kMinPasswordLength
                                       maxLenth:kMaxPasswordLength
                                 containChinese:NO
                            firstCannotBeDigtal:NO]);
        }];
    }
    return _passwordEnable;
}

- (RACSignal *)emailEnable
{
    if (!_emailEnable) {
        _emailEnable = [RACObserve(self, requestModel.email) map:^id(NSString *value) {
            return @([value isValidEmail]);
        }];
    }
    return _emailEnable;
}

#pragma mark RACCommand

- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        @weakify(self);
        _loginCommand = [[RACCommand alloc] initWithEnabled:self.accountEnable signalBlock:^RACSignal *(id input) {
            @strongify(self);
            NSString *username = self.requestModel.username;
            NSString *password = self.requestModel.password;
            return  [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [BmobUser loginInbackgroundWithAccount:username andPassword:password block:^(BmobUser *user, NSError *error) {
                    if (error) {
                        [subscriber sendError:error];
                    }else if (user)
                    {
                        [subscriber sendNext:user];
                        [subscriber sendCompleted];
                    }else
                    {
                        [subscriber sendError:[MSWebDataClient defaultError]];
                    }
                }];
                return nil;
            }] catch:^RACSignal *(NSError *error) {
                self.operationError = error;
                return [RACSignal error:error];
            }];
        }];
    }
    return _loginCommand;
}

- (RACCommand *)logoutCommand
{
    if (!_logoutCommand) {
        _logoutCommand = [[RACCommand alloc] initWithEnabled:[RACObserve(self, dataModel) map:^id(id value) {
            return @(value != nil);
        }] signalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [BmobUser logout];
                self.dataModel = nil;
                [[NSNotificationCenter defaultCenter] postNotificationName:kNofityUserLogoutKey object:nil];
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _logoutCommand;
}

- (RACCommand *)registerCommand
{
    if (!_registerCommand) {
        @weakify(self);
        _registerCommand = [[RACCommand alloc] initWithEnabled:[RACSignal combineLatest:@[self.emailEnable,self.accountEnable] reduce:^id(NSNumber *mail,NSNumber *account){
            return @(mail.boolValue && account.boolValue);
        }] signalBlock:^RACSignal *(id input) {
            @strongify(self);
            BmobUser *user = [BmobUser new];
            user.username = self.requestModel.username;
            user.password = self.requestModel.password;
            user.email    = self.requestModel.email;
            return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [user signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
                    if (error) {
                        [subscriber sendError:error];
                    } else {
                        if (isSuccessful) {
                            [subscriber sendNext:[BmobUser getCurrentUser]];
                            [subscriber sendCompleted];
                        } else {
                            [subscriber sendError:[MSWebDataClient defaultError]];
                        }
                    }
                }];
                return nil;
            }] catch:^RACSignal *(NSError *error) {
                self.operationError = error;
                return [RACSignal error:error];
            }] ;
        }];
    }
    return _registerCommand;
}

- (RACCommand *)changePasswordCommand
{
    if (!_changePasswordCommand) {
        @weakify(self);
        _changePasswordCommand = [[RACCommand alloc] initWithEnabled:[RACSignal combineLatest:@[RACObserve(self, requestModel.password),RACObserve(self, requestModel.changePassword)] reduce:^id{
            return @YES;
        }] signalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [[BmobUser getCurrentUser] updateCurrentUserPasswordWithOldPassword:self.requestModel.password newPassword:self.requestModel.changePassword block:^(BOOL isSuccessful, NSError *error) {
                    if (error) {
                        [subscriber sendError:error];
                    }else if (isSuccessful)
                    {
                        [subscriber sendNext:@YES];
                        [subscriber sendCompleted];
                    }else
                    {
                        [subscriber sendError:[MSWebDataClient defaultError]];
                    }
                }];
                return nil;
            }] catch:^RACSignal *(NSError *error) {
                self.operationError = error;
                return [RACSignal error:error];
            }];
        }];
    }
    return _changePasswordCommand;
}

- (RACCommand *)forgetPasswordCommand
{
    if (!_forgetPasswordCommand) {
        @weakify(self);
        _forgetPasswordCommand = [[RACCommand alloc] initWithEnabled:self.emailEnable signalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [BmobUser requestPasswordResetInBackgroundWithEmail:self.requestModel.email];
                [subscriber sendNext:@YES];
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    return _forgetPasswordCommand;
}

@end
