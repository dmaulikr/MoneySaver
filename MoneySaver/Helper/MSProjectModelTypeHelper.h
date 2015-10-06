//
//  MSBaseProjectModelTypeHelper.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//TODO: 暂不支持自定义类型,所以总数为25
static NSInteger const kNumOfMSProjectModelType =  25;
static NSInteger const kCommonEnumValueFotType  = 1000;

typedef NS_ENUM(NSUInteger, MSProjectModelType) {
    
    MSProjectModelUnkonwType   = 0,     ///< 未知
    MSProjectModelIncomeType   = 1,     ///< 收入
    MSProjectModelGeneralType  = 2,     ///< 通用

    MSProjectModelHotelType    = 1001,   ///< 住宿
    MSProjectModelMakeUpType   = 1002,   ///< 化妆
    MSProjectModelMedicalType  = 1003,   ///< 药品
    MSProjectModelPersonalType = 1004,   ///< 个人
    MSProjectModelAppType      = 1005,   ///< APP
    MSProjectModelPetType      = 1006,   ///< 宠物
    MSProjectModelTrafficType  = 1007,   ///< 交通
    MSProjectModelCarType      = 1008,   ///< 汽车
    MSProjectModelMovieType    = 1009,   ///< 电影
    MSProjectModelFoodType     = 1010,   ///< 食品
    MSProjectModelBooksType    = 1011,   ///< 书籍
    MSProjectModeliTunesType   = 1012,   ///< iTunes
    MSProjectModelComputerType = 1013,   ///< 电脑
    MSProjectModelGiftType     = 1014,   ///< 礼物
    MSProjectModelKidsType     = 1015,   ///< 儿童
    MSProjectModelHouseType    = 1016,   ///< 家庭
    MSProjectModelJuiceType    = 1017,   ///< 饮料
    MSProjectModelShoppingType = 1018,   ///< 购物
    MSProjectModelTravelType   = 1019,   ///< 节日
    MSProjectModelFitnessType  = 1020,   ///< 健身
    MSProjectModelClothType    = 1021,   ///< 衣服
    MSProjectModelMobileType   = 1022,   ///< 手机
    
    MSProjectModelCustomType   = 2000,   ///< 自定义
};



@interface MSProjectModelTypeHelper : NSObject

//+ (MSProjectModelType)stringToProjectModelType:(NSString *)string;
//+ (NSString *)projectModelTypeToString:(MSProjectModelType)type;

+ (NSString *)projectModelTypeToChinese:(MSProjectModelType)type;
+ (UIImage *)projectModelTypeToImage:(MSProjectModelType)type size:(CGSize)size hightlight:(BOOL)hightlight;

@end
