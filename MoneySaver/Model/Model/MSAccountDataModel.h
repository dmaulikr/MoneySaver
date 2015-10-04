//
//  AccountDataModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/9/21.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>
#import <MTLFMDBAdapter.h>


@interface MSAccountRequestModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *username; /**< 用户名 */
@property (nonatomic, copy) NSString *password; /**< 密码 */
@property (nonatomic, copy) NSString *changePassword; /**< 新密码 */
@property (nonatomic, copy) NSString *email; /**< 邮箱 */

@end

/**
 *  用户模型
 */
@interface MSAccountDataModel : MTLModel <MTLJSONSerializing,MTLFMDBSerializing>

@property (nonatomic, copy) NSString *accoundId;/**< 唯一值 */
@property (nonatomic, copy) NSString *account;/**< 用户名 */

@property (nonatomic, copy) NSNumber *monthLimit;/**< 每月限额 */
@property (nonatomic, copy) NSURL    *userImage;/**< 头像 */
@property (nonatomic, copy) NSURL    *backgroundImage;/**< 背景图 */



@end
