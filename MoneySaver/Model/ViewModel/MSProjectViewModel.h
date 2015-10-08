//
//  BaseProjectViewModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassViewModel.h"
#import "MSBaseProjectModel.h"

@interface MSProjectViewModel : MSBaseDataViewModel

+ (instancetype)projectWithModel:(MSBaseProjectModel *)model;

@property (nonatomic, strong) MSBaseProjectModel *dataModel;        ///< 数据模型

@property (nonatomic, strong) NSError            *updateDataError;  ///< 更新数据错误
@property (nonatomic, assign) BOOL               newData;           ///< 是否未新数据

@property (nonatomic, strong) RACCommand         *updateCommand;    ///< 更新命令

@end
