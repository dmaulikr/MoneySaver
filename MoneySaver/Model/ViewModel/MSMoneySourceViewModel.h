//
//  MoneySourceViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSMoneySourceModel.h"

#import "MSProjectManagerViewModel.h"
#import "MSProjectViewModel.h"

@interface MSMoneySourceViewModel : MSBaseDataViewModel


+ (instancetype)sourceWithModel:(MSMoneySourceModel *)model;

@property (nonatomic, strong) MSMoneySourceModel *dataModel;        ///< 数据模型
@property (nonatomic, strong) NSError            *updateDataError;  ///< 更新数据错误
@property (nonatomic, assign) BOOL               newData;           ///< 是否未新数据
@property (nonatomic, strong) RACCommand         *updateCommand;    ///< 更新命令


@property (nonatomic, strong) MSProjectManagerViewModel *projectLisy;    ///< 项目列表
@property (nonatomic, strong) RACCommand                *findProjectList;///< 获取项目列表

- (void)updateMoneySource;

@end
