//
//  AccountViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSAccountViewModel.h"
#import <BmobUser.h>

@interface MSAccountViewModel ()

@property (nonatomic, strong) RACSignal *accountEnable;
@property (nonatomic, strong) RACSignal *emailEnable;


@end

@implementation MSAccountViewModel


#pragma mark - Getter


- (MSAccountRequestModel *)accountRequestModel
{
    if (!_accountRequestModel) {
        _accountRequestModel = [MSAccountRequestModel new];
    }
    return _accountRequestModel;
}


- (RACSignal *)accountEnable
{
    if (!_accountEnable) {
        _accountEnable = [RACSignal combineLatest:@[RACObserve(self, accountRequestModel.username),
                                                    RACObserve(self, accountRequestModel.password),]
                                           reduce:^id{
            return @YES;
        }];
    }
    return _accountEnable;
}

- (RACSignal *)emailEnable
{
    if (!_emailEnable) {
        _emailEnable = [RACObserve(self, accountRequestModel.email) map:^id(id value) {
            return @NO;
        }];
    }
    return _emailEnable;
}

- (RACCommand *)accountLoginCommand
{
    if (!_accountLoginCommand) {
        @weakify(self);
        _accountLoginCommand = [[RACCommand alloc] initWithEnabled:self.accountEnable signalBlock:^RACSignal *(id input) {
            @strongify(self);
            NSString *username = self.accountRequestModel.username;
            NSString *password = self.accountRequestModel.password;
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
                self.commandError = error;
                return [RACSignal error:error];
            }];
        }];
    }
    return _accountLoginCommand;
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
            user.username = self.accountRequestModel.username;
            user.password = self.accountRequestModel.password;
            user.email    = self.accountRequestModel.email;
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
                self.commandError = error;
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
        _changePasswordCommand = [[RACCommand alloc] initWithEnabled:[RACSignal combineLatest:@[RACObserve(self, accountRequestModel.password),RACObserve(self, accountRequestModel.changePassword)] reduce:^id{
            return @YES;
        }] signalBlock:^RACSignal *(id input) {
            @strongify(self);
           return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
               [[BmobUser getCurrentUser] updateCurrentUserPasswordWithOldPassword:self.accountRequestModel.password newPassword:self.accountRequestModel.changePassword block:^(BOOL isSuccessful, NSError *error) {
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
               [BmobUser requestPasswordResetInBackgroundWithEmail:self.accountRequestModel.email];
               [subscriber sendCompleted];
               return nil;
           }];
        }];
    }
    return _forgetPasswordCommand;
}

@end
