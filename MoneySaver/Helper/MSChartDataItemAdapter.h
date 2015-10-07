//
//  MSChartDataItemAdapter.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/7.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PNPieChartDataItem.h>
#import "MSBaseProjectModel.h"

@interface MSChartDataItemAdapter : NSObject

+ (PNPieChartDataItem *)pieCharDataItem:(MSBaseProjectModel *)model;
+ (NSArray <PNPieChartDataItem *>* )pieCharDataArray:(NSArray <MSBaseProjectModel *> *)modelArray;

@end
