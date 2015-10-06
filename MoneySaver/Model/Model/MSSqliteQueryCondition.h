//
//  MSSqliteQueryCondition.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/6.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSSqliteQueryCondition : NSObject

@property (nonatomic, copy  ) NSString *likeName;
@property (nonatomic, copy  ) NSString *likeValue;

@property (nonatomic, copy  ) NSString *filterName;
@property (nonatomic, copy  ) id       filterValue;


@property (nonatomic, copy  ) NSString *shortName;
@property (nonatomic, assign) BOOL     shortDesc;

- (NSString *)createQueryCondition;

@end
