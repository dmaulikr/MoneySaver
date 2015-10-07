//
//  MSChartDataItemAdapter.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/7.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSChartDataItemAdapter.h"
#import <Chameleon.h>

@implementation MSChartDataItemAdapter
+ (PNPieChartDataItem *)pieCharDataItem:(MSBaseProjectModel *)model
{
    return [PNPieChartDataItem dataItemWithValue:model.value.floatValue color:[UIColor randomFlatColor] description:model.name];
}

+ (NSArray <PNPieChartDataItem *>* )pieCharDataArray:(NSArray <MSBaseProjectModel *> *)modelArray
{
    NSMutableArray *muArry = [NSMutableArray new];
    for (MSBaseProjectModel *project in modelArray) {
        [muArry addObject:[MSChartDataItemAdapter pieCharDataItem:project]];
    }
    return muArry;
}

@end
