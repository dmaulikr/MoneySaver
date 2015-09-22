//
//  AccountViewModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSAccountViewModel.h"

@interface MSAccountViewModel ()

@property (nonatomic, strong) RACSignal *accountEnable;
@property (nonatomic, strong) RACSignal *emailEnable;


@end

@implementation MSAccountViewModel




#pragma mark - Getter

- (RACSignal *)accountEnable
{
    if (!_accountEnable) {
        _accountEnable = [RACSignal combineLatest:@[RACObserve(self, accountRequestModel.account),
                                                    RACObserve(self, accountRequestModel.password),] reduce:^id{
            return @NO;
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
            RACSignal *loginSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                [subscriber sendCompleted];
                return nil;
            }];
            return loginSignal;
        }];
    }
    return _accountLoginCommand;
}


@end
