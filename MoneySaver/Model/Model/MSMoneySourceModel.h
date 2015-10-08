//
//  MoneySourceModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassDataModel.h"
typedef NS_ENUM(NSUInteger, MoneySourceModelType) {
    SourceModelOtherType  = 0,
    SourceModelBankType   = 1,
    SourceModelAlipayType = 2,
    SourceModelCashType   = 3,
};

@interface MSMoneySourceModel : MSBaseClassDataModel <MTLJSONSerializing>

//@property (nonatomic, strong) NSString *objectId; ///< 主键(父类中)

@property (nonatomic, assign) MoneySourceModelType sourceType;///< 资金来源

@property (nonatomic, copy  ) NSNumber *total;///< 资金总额
@property (nonatomic, copy  ) NSString *sourceName;///< 资金名称

@end
