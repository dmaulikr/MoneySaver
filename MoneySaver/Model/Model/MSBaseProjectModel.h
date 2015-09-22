//
//  BaseProjectModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>
#import <UIKit/UIKit.h>
#import <MTLFMDBAdapter.h>


typedef NS_ENUM(NSUInteger, ProjectTransactionType) {
    TransactionTypeIncome,
    TransactionTypeOutlay,
    TransactionTypeTurn,
};

typedef NS_ENUM(NSUInteger, BaseProjectModelType) {
    UnkonwProjectType
};



FOUNDATION_EXPORT NSString *ProjectTransactionTypeToString(ProjectTransactionType type);
FOUNDATION_EXPORT NSString *BaseProjectModelTypeToString(BaseProjectModelType type);
FOUNDATION_EXPORT NSString *BaseProjectModelTypeToChinese(BaseProjectModelType type);
FOUNDATION_EXPORT UIImage  *BaseProjectModelTypeToImage(BaseProjectModelType type);

FOUNDATION_EXPORT ProjectTransactionType StringToProjectTransactionType(NSString *string);
FOUNDATION_EXPORT BaseProjectModelType   StringToBaseProjectModelType(NSString *string);


/**
 *  账单项目模型
 */
@interface MSBaseProjectModel : MTLModel <MTLJSONSerializing,MTLFMDBSerializing>

@property (nonatomic, copy) NSString *projectId; /**< 项目id*/

@property (nonatomic, assign) ProjectTransactionType transactionType; /**< 交易类型 */
@property (nonatomic, assign) BaseProjectModelType   projectType;    /**< 账单类型 */

@property (nonatomic, copy) NSDate      *date; /**< 账单日期 */
@property (nonatomic, copy) NSString    *name; /**< 账单名称 */
@property (nonatomic, copy) NSNumber    *value; /**< 账单金额 */
@property (nonatomic, copy) NSString    *note; /**< 账单备注 */

@property (nonatomic, copy) NSString    *sourceId; /**< 资金来源 */

@end

