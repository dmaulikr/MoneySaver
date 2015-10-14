//
//  MTLModel+MSDataBase.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/14.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Mantle.h>
#import <LKDBHelper.h>

@interface MTLModel (MSDataBase)


+ (NSError *)databaseLastError;

@end
