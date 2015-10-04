//
//  MSProjectTypeListDataSource.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectTypeListDataSource.h"
#import "MSProjectTypeCollectionViewCell.h"


//- ()

@interface MSProjectTypeListDataSource ()

@end

@implementation MSProjectTypeListDataSource

+ (UICollectionViewLayout *)collectionViewLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat size = kMSProjectTypeCollectionViewCellWidth;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(size, size);
//    layout.minimumInteritemSpacing = CGFLOAT_MIN;
//    layout.minimumLineSpacing = CGFLOAT_MIN;
    return layout;
}

+ (instancetype)registerForCollectionView:(UICollectionView *)collectionView
{
    MSProjectTypeListDataSource *dataSource = [MSProjectTypeListDataSource new];
    [collectionView registerClass:[MSProjectTypeCollectionViewCell class]
       forCellWithReuseIdentifier:kMSProjectTypeCollectionViewCellIden];
    collectionView.dataSource = dataSource;
    return dataSource;
}


#pragma mark - UICollectionViewDataSource
- (MSProjectModelType)typeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    switch (index) {
        case 0:return MSProjectModelIncomeType;
        case 1:return MSProjectModelGeneralType;
        case (kNumOfMSProjectModelType - 1):return MSProjectModelUnkonwType;
        default:
            return (index - 1 + kCommonEnumValueFotType);
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kNumOfMSProjectModelType;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSProjectTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMSProjectTypeCollectionViewCellIden forIndexPath:indexPath];
    cell.projectType = [self typeForItemAtIndexPath:indexPath];
    if (cell.selected){cell.projectType = [self typeForItemAtIndexPath:indexPath];}
    return cell;
}


@end
