//
//  MSBaseProjectModelTypeHelper.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MSProjectModelType) {
    
    MSProjectModelUnkonwType       = 0,     ///< 未知
    MSProjectModelTypeIncomeType   = 1,     ///< 收入
    MSProjectModelTypeGeneralType  = 2,     ///< 通用

    MSProjectModelTypeHotelType    = 1001,   ///< 住宿
    MSProjectModelTypeMakeUpType   = 1002,   ///< 化妆
    MSProjectModelTypeMedicalType  = 1003,   ///< 药品
    MSProjectModelTypePersonalType = 1004,   ///< 个人
    MSProjectModelTypeAppType      = 1005,   ///< APP
    MSProjectModelTypePetType      = 1006,   ///< 宠物
    MSProjectModelTypeTrafficType  = 1007,   ///< 交通
    MSProjectModelTypeCarType      = 1008,   ///< 汽车
    MSProjectModelTypeMovieType    = 1009,   ///< 电影
    MSProjectModelTypeFoodType     = 1010,   ///< 食品
    MSProjectModelTypeBooksType    = 1011,   ///< 书籍
    MSProjectModelTypeiTunesType   = 1012,   ///< iTunes
    MSProjectModelTypeComputerType = 1013,   ///< 电脑
    MSProjectModelTypeGiftType     = 1014,   ///< 礼物
    MSProjectModelTypeKidsType     = 1015,   ///< 儿童
    MSProjectModelTypeHouseType    = 1016,   ///< 家庭
    MSProjectModelTypeJuiceType    = 1017,   ///< 饮料
    MSProjectModelTypeShoppingType = 1018,   ///< 购物
    MSProjectModelTypeTravelType   = 1019,   ///< 节日
    MSProjectModelTypeFitnessType  = 1020,   ///< 健身
    MSProjectModelTypeClothType    = 1021,   ///< 衣服
    MSProjectModelTypeMobileType   = 1022,   ///< 手机
};



@interface MSProjectModelTypeHelper : NSObject

//+ (MSProjectModelType)stringToProjectModelType:(NSString *)string;
//+ (NSString *)projectModelTypeToString:(MSProjectModelType)type;

+ (NSString *)projectModelTypeToChinese:(MSProjectModelType)type;
+ (UIImage *)projectModelTypeToImage:(MSProjectModelType)type size:(CGSize)size hightlight:(BOOL)hightlight;

@end
