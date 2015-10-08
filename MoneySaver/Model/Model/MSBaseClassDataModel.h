//
//  MSBaseClassDataModel.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/8.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>
#import <MTLFMDBAdapter.h>

//数据基类
@interface MSBaseClassDataModel : MTLModel<MTLJSONSerializing,MTLFMDBSerializing>

@property (nonatomic, strong) NSString *objectId;

@end
