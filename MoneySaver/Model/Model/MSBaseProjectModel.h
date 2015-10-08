//
//  BaseProjectModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassDataModel.h"
#import "MSProjectModelTypeHelper.h"
#import "MSProjectTransactionTypeHelper.h"



/**
 *  账单项目模型
 */
@interface MSBaseProjectModel : MSBaseClassDataModel <MTLJSONSerializing>

//@property (nonatomic, strong) NSString *objectId; ///< 主键(父类中)

@property (nonatomic, assign) MSProjectTransactionType transactionType;/**< 交易类型 */
@property (nonatomic, assign) MSProjectModelType       projectType;/**< 账单类型 */

@property (nonatomic, copy  ) NSDate                   *date;/**< 账单日期 */
@property (nonatomic, copy  ) NSString                 *name;/**< 账单名称 */
@property (nonatomic, copy  ) NSNumber                 *value;/**< 账单金额 */
@property (nonatomic, copy  ) NSString                 *note;/**< 账单备注 */

@property (nonatomic, copy  ) NSString                 *sourceId;/**< 资金来源 */

@end

