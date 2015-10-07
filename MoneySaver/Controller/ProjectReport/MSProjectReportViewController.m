//
//  MSProjectReportViewController.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/5.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectReportViewController.h"

#import "MSProjectListHeaderView.h"
#import "MSProjectListTableViewCell.h"

@interface MSProjectReportViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) MSProjectManagerViewModel *viewModel;
@property (nonatomic, strong) MSProjectListHeaderView   *headerView;
@property (nonatomic, strong) UITableView               *projectList;

@end

@implementation MSProjectReportViewController

#pragma mark - Life Cycle

- (instancetype)initWithViewModel:(id)viewmodel
{
    self = [super init];
    if (self) {
        _viewModel = viewmodel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private Method
- (void)configureViewController
{
    [self.view addSubview:self.projectList];
}
- (void)layoutViewController
{
}
- (void)configureSignal
{
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.projectArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MSProjectListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMSProjectListTableViewCellIden forIndexPath:indexPath];
    cell.dataModel = [self.viewModel.projectArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO: 跳转至详情
}

#pragma mark - Getter
- (UITableView *)projectList
{
    if (!_projectList) {
        _projectList = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_projectList registerClass:[MSProjectListTableViewCell class] forCellReuseIdentifier:kMSProjectListTableViewCellIden];
        _projectList.dataSource = self;
        _projectList.delegate   = self;
        _projectList.tableHeaderView = self.headerView;
        _projectList.rowHeight = kMSProjectListTableViewCellHeight;
    }
    return _projectList;
}

- (MSProjectListHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [MSProjectListHeaderView projectListHeaderView];
        _headerView.viewModel = self.viewModel;
    }
    return _headerView;
}



@end
