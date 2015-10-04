//
//  MSProjectTypeListDataSource.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSProjectModelTypeHelper.h"

@interface MSProjectTypeListDataSource : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

+ (UICollectionViewLayout *)collectionViewLayout;
+ (instancetype)registerForCollectionView:(UICollectionView *)collectionView;
- (MSProjectModelType)typeForItemAtIndexPath:(NSIndexPath *)indexPath;



@end
