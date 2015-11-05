//
//  MSProjectEditorViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectEditorViewController.h"
#import "MSProjectReportViewController.h"

#import "MSProjectValueHeaderView.h"
#import "MSProjectTypeCollectionViewCell.h"
#import "MSNumberKeyBord.h"
#import "MSBarButtonItem.h"

#import "MSProjectTypeListDataSource.h"

#import <IQKeyboardManager.h>

@interface MSProjectEditorViewController ()<UICollectionViewDelegate>

@property (nonatomic, assign ,getter=isQuickMode) BOOL quickMode;

@property (nonatomic, strong) MSProjectValueHeaderView    *headerView;
@property (nonatomic, strong) UICollectionView            *projectTypeList;
@property (nonatomic, strong) MSProjectTypeListDataSource *typeDataSource;
@property (nonatomic, strong) MSNumberKeyBord             *numberKeybord;

@property (nonatomic, strong) MSProjectViewModel          *viewModel;
@end

@implementation MSProjectEditorViewController

#pragma mark - Life Cycle
+ (instancetype)projectEditorViewControllerForQuickMode
{
    MSProjectViewModel *vm = [MSProjectViewModel new];
    vm.dataModel = [MSBaseProjectModel new];
    vm.dataModel.date = [NSDate date];
    MSProjectEditorViewController *project = [[MSProjectEditorViewController alloc] initWithViewModel:vm];
    project.quickMode = YES;
    return project;
}

//+ (instancetype)projectEditorViewControllerForModel:(MSProjectViewModel *)model
//{
//    
//}
//


- (instancetype)initWithViewModel:(id)viewmodel
{
    self = [super initWithViewModel:viewmodel];
    if (self) {
        _viewModel = viewmodel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
    [self layoutViewController];
    [self configureSignal];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[IQKeyboardManager sharedManager] setEnable:NO];
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    [self.headerView.valueFiled becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[IQKeyboardManager sharedManager] setEnable:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Method
- (void)configureViewController
{
    @weakify(self);
    if (self.isQuickMode) {
        
        MSBarButtonItem *chartButton = [MSBarButtonItem chartButton];
        [chartButton setBarButtonActionBlock:^(id sender) {
            @strongify(self);
            MSProjectManagerViewModel *manager = [MSProjectManagerViewModel currentProjectManager];
            MSProjectReportViewController *vc = [[MSProjectReportViewController alloc] initWithViewModel:manager];
            [self.navigationController popViewControllerAnimated:NO];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        self.navigationItem.rightBarButtonItem = chartButton;
    } else {
        MSBarButtonItem *calendarButton = [MSBarButtonItem calendarButton];
        MSBarButtonItem *noteButton     = [MSBarButtonItem noteButton];
        MSBarButtonItem *closeButton    = [MSBarButtonItem closeButton];
        
        self.navigationItem.rightBarButtonItems = @[calendarButton,noteButton];
        self.navigationItem.leftBarButtonItem   = closeButton;
        
        [closeButton setBarButtonActionBlock:^(id sender) {
            @strongify(self);
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [noteButton setBarButtonActionBlock:^(id sender) {
//            @strongify(self);
        }];
        [calendarButton setBarButtonActionBlock:^(id sender) {
//            @strongify(self);
        }];
    }
    
    self.viewModel.newData = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.projectTypeList];
    
    [self.numberKeybord setInputComplete:^(NSString *value) {
        @strongify(self);
        self.viewModel.dataModel.value = [NSNumber numberWithDouble:value.doubleValue];
        [self.viewModel.updateCommand execute:nil];
    }];

}

- (void)layoutViewController
{
    @weakify(self);
    CGFloat headerViewHeight = kMSProjectValueHeaderViewHeight;
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, headerViewHeight));
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    [self.projectTypeList mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.headerView.mas_bottom);
        make.left.bottom.and.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, kMSNumberKeyBordHeight, 0));
    }];
}

- (void)configureSignal
{
    self.headerView.viewModel = self.viewModel;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSProjectModelType projectType = [self.typeDataSource typeForItemAtIndexPath:indexPath];
    self.viewModel.dataModel.projectType = projectType;
}


#pragma mark - Getter
- (UICollectionView *)projectTypeList
{
    if (!_projectTypeList) {
        _projectTypeList = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[MSProjectTypeListDataSource collectionViewLayout]];
        _typeDataSource = [MSProjectTypeListDataSource registerForCollectionView:_projectTypeList];
        _projectTypeList.dataSource = _typeDataSource;
        _projectTypeList.delegate = self;
        _projectTypeList.bounces = YES;
        _projectTypeList.backgroundColor = [UIColor clearColor];
    }
    return _projectTypeList;
}


- (MSProjectValueHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [MSProjectValueHeaderView projectValueHeaderView];
        _numberKeybord = [[MSNumberKeyBord alloc] initWithTextField:_headerView.valueFiled];
    }
    return _headerView;
}
@end
