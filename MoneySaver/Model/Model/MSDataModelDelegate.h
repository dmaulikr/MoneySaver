//
//  MSBaseClassDataModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MTLModel+MSDataBase.h"


@protocol MSDataModelDelegate <NSObject>

@required

/**
 *  需要保存到数据库的信息必须遵守该协议,并在类的实现中添加 // @synthesize objectId = _objectId;
 */
@property (nonatomic, strong) NSString *objectId;

@end
