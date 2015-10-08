//
//  AccountDataModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBaseClassDataModel.h"

@interface MSAccountRequestModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *username; /**< 用户名 */
@property (nonatomic, copy) NSString *password; /**< 密码 */
@property (nonatomic, copy) NSString *changePassword; /**< 新密码 */
@property (nonatomic, copy) NSString *email; /**< 邮箱 */

@end

/**
 *  用户模型
 */
@interface MSAccountDataModel : MSBaseClassDataModel <MTLJSONSerializing>

//@property (nonatomic, strong) NSString *objectId; ///< 主键(父类中)

@property (nonatomic, copy) NSString *account;/**< 用户名 */

@property (nonatomic, copy) NSNumber *monthLimit;/**< 每月限额 */
@property (nonatomic, copy) NSURL    *userImage;/**< 头像 */

@end
