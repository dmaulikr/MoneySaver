//
//  MSLoginMainViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/23.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSLoginMainViewController.h"


//UI Views
#import <JVFloatLabeledTextField.h>
#import <FontAwesomeKit/FAKFontAwesome.h>
#import "MSSubmitTransitionButton.h"
#import "MSFadeTransition.h"


#define kLoginButtonHeight 40
#define kInputIconHeight   40
#define kInputFieldHeight  40

@interface MSLoginMainViewController ()<UIViewControllerTransitioningDelegate>


// UI Views
@property (nonatomic, strong) UIImageView              *backgroundView;
@property (nonatomic, strong) UIImageView              *logoImageView;
@property (nonatomic, strong) UIImageView              *usernameIcon;
@property (nonatomic, strong) UIImageView              *passwordIcon;
@property (nonatomic, strong) JVFloatLabeledTextField  *usernameField;
@property (nonatomic, strong) JVFloatLabeledTextField  *passwordField;
@property (nonatomic, strong) MSSubmitTransitionButton *loginButton;
@property (nonatomic, strong) UIButton                 *registerButton;

@end

@implementation MSLoginMainViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
    [self layoutViewController];
    [self configureSignal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Method
- (void)configureViewController
{
//    self.view.backgroundColor = [UIColor darkGrayColor];
    self.transitioningDelegate = self;
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.usernameIcon];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordIcon];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.registerButton];
    
    [self.view addSubview:self.loginButton];

    
}

- (void)layoutViewController
{
    WeakSelf;
    
    
    CGFloat fieldSpace  = 30;
    CGFloat commonSpace = 8;
    CGFloat imageSpace  = 60;
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(imageSpace);
        make.bottom.equalTo(weakSelf.usernameField).offset(-imageSpace);
        make.width.equalTo(weakSelf.logoImageView.mas_height);
        make.centerX.equalTo(weakSelf.view);
    }];

    
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_centerY);
        make.right.equalTo(weakSelf.view).offset(-fieldSpace);
        make.left.equalTo(weakSelf.view).offset(fieldSpace+commonSpace+kInputIconHeight);
    }];
    
    [self.usernameIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.usernameField);
        make.size.mas_equalTo(CGSizeMake(kInputIconHeight, kInputIconHeight));
        make.right.equalTo(weakSelf.usernameField.mas_left).offset(-commonSpace);
    }];

    
    [self.passwordIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.passwordField);
        make.size.equalTo(weakSelf.usernameIcon);
        make.centerX.equalTo(weakSelf.usernameIcon);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.usernameField);
        make.centerX.equalTo(weakSelf.usernameField);
        make.top.equalTo(weakSelf.usernameField.mas_bottom).offset(2*commonSpace);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.passwordField.mas_bottom).offset(4*commonSpace);
        make.height.mas_equalTo(kLoginButtonHeight);
        make.left.equalTo(weakSelf.view).offset(3*fieldSpace);
        make.right.equalTo(weakSelf.view).offset(-3*fieldSpace);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view).offset(-10);
        make.width.mas_equalTo(200);
        make.centerX.equalTo(weakSelf.view);
    }];
}

- (void)configureSignal
{
    
}

#pragma mark - Getter

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
//        UIImage *image = [[FAKFontAwesome moneyIconWithSize:50] imageWithSize:CGSizeMake(50, 50)];
        _logoImageView = [[UIImageView alloc] init];
    }
    return _logoImageView;
}

- (UIImageView *)usernameIcon
{
    if (!_usernameIcon) {
        UIImage *image = [[FAKFontAwesome userIconWithSize:20] imageWithSize:CGSizeMake(kInputIconHeight, kInputIconHeight)];
        _usernameIcon = [[UIImageView alloc] initWithImage:image];
    }
    return _usernameIcon;
}

- (UIImageView *)passwordIcon
{
    if (!_passwordIcon) {
    UIImage *image = [[FAKFontAwesome lockIconWithSize:20] imageWithSize:CGSizeMake(kInputIconHeight, kInputIconHeight)];
    _passwordIcon = [[UIImageView alloc] initWithImage:image];
}
    return _passwordIcon;

}

- (JVFloatLabeledTextField *)usernameField
{
    if (!_usernameField) {
        _usernameField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        [_usernameField setPlaceholder:@"输入账户" floatingTitle:@"账户"];
        _usernameField.floatingLabelActiveTextColor = [UIColor darkGrayColor];
        _usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
//        _usernameField.keyboardType = UIKeyboardTypeDecimalPad;
    }
    return _usernameField;
}

- (JVFloatLabeledTextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectZero];
        [_passwordField setPlaceholder:@"输入密码" floatingTitle:@"密码"];
        _passwordField.floatingLabelActiveTextColor = [UIColor darkGrayColor];
        _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordField.secureTextEntry = YES;
    }
    return _passwordField;
}

- (MSSubmitTransitionButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[MSSubmitTransitionButton alloc] initWithFrame:CGRectMake(0, 0, kLoginButtonHeight, kLoginButtonHeight)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        WeakSelf;
        [_loginButton setLoadingComplete:^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }];
        [[_loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [weakSelf.loginButton animate:2.0f complete:^{
                [weakSelf.loginButton startFinishAnimation];
            }];
        }];
    }
    return _loginButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        _registerButton = [UIButton new];
        NSString *title = @"没有账户 ? 立即注册 !";
        NSString *imTitle = @"立即注册";
        NSMutableAttributedString *muAttrStr = [[NSMutableAttributedString alloc] initWithString:title];
        [muAttrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor],
                                   NSFontAttributeName:[UIFont systemFontOfSize:14]}
                           range:NSMakeRange(0, title.length)];
        [muAttrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor],
                                   NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                   NSUnderlineStyleAttributeName:@1}
                           range:[title rangeOfString:imTitle]];
        [_registerButton setAttributedTitle:muAttrStr forState:UIControlStateNormal];
    }
    return _registerButton;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [MSFadeTransition new];
}


@end
