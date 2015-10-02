//
//  MSMSProjectTypeCollectionViewCell.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectModelTypeHelper.h"

#define kMSMSProjectTypeCollectionViewCellWidth (SCREEN_WIDTH/5.0)

@interface MSMSProjectTypeCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) MSProjectModelType projectType;

@end
