//
//  MSProjectTransactionTypeHelper.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, MSProjectTransactionType) {
    MSTransactionTypeIncome = 0,
    MSTransactionTypeOutlay = 1,
    MSTransactionTypeTurn   = 2,
};


FOUNDATION_EXPORT NSString *ProjectTransactionTypeToString(MSProjectTransactionType type);
FOUNDATION_EXPORT MSProjectTransactionType StringToProjectTransactionType(NSString *string);


