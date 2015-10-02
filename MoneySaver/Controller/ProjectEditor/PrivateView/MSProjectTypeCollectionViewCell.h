//
//  MSMSProjectTypeCollectionViewCell.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectModelTypeHelper.h"

#define kMSProjectTypeCollectionViewCellWidth (SCREEN_WIDTH/5.0)
#define kMSProjectTypeCollectionViewCellIden @"MSProjectTypeCollectionViewCell"

@interface MSProjectTypeCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) MSProjectModelType projectType;

@end
