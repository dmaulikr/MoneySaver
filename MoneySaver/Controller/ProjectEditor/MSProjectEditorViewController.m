//
//  MSProjectEditorViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectEditorViewController.h"

#import "MSProjectValueHeaderView.h"
#import "MSProjectTypeCollectionViewCell.h"
#import "MSNumberKeyBord.h"
#import "MSBarButtonItem.h"

#import "MSProjectTypeListDataSource.h"
#import "MSProjectViewModel.h"

@interface MSProjectEditorViewController ()<UICollectionViewDelegate>

@property (nonatomic, assign ,getter=isQuickMode) BOOL quickMode;

@property (nonatomic, strong) MSProjectValueHeaderView *headerView;
@property (nonatomic, strong) UICollectionView *projectTypeList;
@property (nonatomic, strong) MSProjectTypeListDataSource *typeDataSource;

@property (nonatomic, strong) MSProjectViewModel *viewModel;


@end

@implementation MSProjectEditorViewController

#pragma mark - Life Cycle
+ (UINavigationController *)projectEditorViewControllerForMode:(BOOL)isQuick
{
    MSProjectViewModel *vm = [MSProjectViewModel new];
    MSProjectEditorViewController *project = [[MSProjectEditorViewController alloc] initWithViewModel:vm];
    project.quickMode = isQuick;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:project];
    return nav;
}


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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Private Method
- (void)configureViewController
{
    @weakify(self);
    if (self.isQuickMode) {
        MSBarButtonItem *chartButton = [MSBarButtonItem chartButton];
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
    }
    
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.projectTypeList];
}

- (void)layoutViewController
{
    @weakify(self);
    CGFloat headerViewHeight = kMSProjectValueHeaderViewHeight;
    [self.projectTypeList mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(headerViewHeight, 0, kMSNumberKeyBordHeight, 0));
    }];
}

- (void)configureSignal
{
    
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
        _projectTypeList.pagingEnabled = YES;
        _projectTypeList.backgroundColor = [UIColor clearColor];
    }
    return _projectTypeList;
}


- (MSProjectValueHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [MSProjectValueHeaderView projectValueHeaderView];
        [_headerView.valueFiled becomeFirstResponder];
    }
    return _headerView;
}
@end
