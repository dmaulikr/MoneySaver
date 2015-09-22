//
//  MoneySourceModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>

typedef NS_ENUM(NSUInteger, MoneySourceModelType) {
    SourceModelOtherType,
    SourceModelBankType,
    SourceModelAlipayType,
    SourceModelCashType,
};

@interface MSMoneySourceModel : MTLModel <MTLJSONSerializing>


@property (nonatomic, assign) MoneySourceModelType sourceType; /**< 资金来源 */

@property (nonatomic, copy) NSNumber *sourceId;/**< 资金ID */
@property (nonatomic, copy) NSNumber *total; /**< 资金总额 */

@end
