//
//  MSBmobDataBojectModel.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/26.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSBmobDataBojectModel.h"

@implementation MSBmobDataBojectModel


+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"fileName":@"filename",
             @"fileData":@"data",
             };
}


@end
