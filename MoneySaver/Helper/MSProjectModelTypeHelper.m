//
//  MSBaseProjectModelTypeHelper.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectModelTypeHelper.h"
#import <FontAwesomeKit/FAKFontAwesome.h>
#import "UIColor+MoneySaver.h"

@implementation MSProjectModelTypeHelper



+ (NSString *)projectModelTypeToChinese:(MSProjectModelType)type;
{
    switch (type) {
        case MSProjectModelUnkonwType:{return @"未知";}
        case MSProjectModelIncomeType:{return @"收入";}
        case MSProjectModelGeneralType:{return @"通用";}
        case MSProjectModelHotelType:{return @"住宿";}
        case MSProjectModelMakeUpType:{return @"化妆";}
        case MSProjectModelMedicalType:{return @"药品";}
        case MSProjectModelPersonalType:{return @"个人";}
        case MSProjectModelAppType:{return @"APP";}
        case MSProjectModelPetType:{return @"宠物";}
        case MSProjectModelTrafficType:{return @"交通";}
        case MSProjectModelCarType:{return @"汽车";}
        case MSProjectModelMovieType:{return @"电影";}
        case MSProjectModelFoodType:{return @"食品";}
        case MSProjectModelBooksType:{return @"书籍";}
        case MSProjectModeliTunesType:{return @"iTunes";}
        case MSProjectModelComputerType:{return @"电脑";}
        case MSProjectModelGiftType:{return @"礼物";}
        case MSProjectModelKidsType:{return @"儿童";}
        case MSProjectModelHouseType:{return @"家庭";}
        case MSProjectModelJuiceType:{return @"饮料";}
        case MSProjectModelShoppingType:{return @"购物";}
        case MSProjectModelTravelType:{return @"节日";}
        case MSProjectModelFitnessType:{return @"健身";}
        case MSProjectModelClothType:{return @"衣服";}
        case MSProjectModelMobileType:{return @"手机";}
        default:return [MSProjectModelTypeHelper projectModelTypeToChinese:MSProjectModelUnkonwType];
    }
}

+ (UIImage *)projectModelTypeToImage:(MSProjectModelType)type size:(CGSize)size hightlight:(BOOL)hightlight
{
    CGFloat fontSize = MIN(size.width, size.height);
    NSString *codeString = nil;
    switch (type) {
        case MSProjectModelUnkonwType:{codeString = @"\uf128";}break;
        case MSProjectModelIncomeType:{codeString = @"\uf019";}break;
        case MSProjectModelGeneralType:{codeString = @"\uf02b";}break;
        case MSProjectModelHotelType:{codeString = @"\uf1ad";}break;
        case MSProjectModelMakeUpType:{codeString = @"\uf182";}break;
        case MSProjectModelMedicalType:{codeString = @"\uf0c3";}break;
        case MSProjectModelPersonalType:{codeString = @"\uf007";}break;
        case MSProjectModelAppType:{codeString = @"\uf099";}break;
        case MSProjectModelPetType:{codeString = @"\uf1b0";}break;
        case MSProjectModelTrafficType:{codeString = @"\uf1b9";}break;
        case MSProjectModelCarType:{codeString = @"\uf0e4";}break;
        case MSProjectModelMovieType:{codeString = @"\uf008";}break;
        case MSProjectModelFoodType:{codeString = @"\uf0f5";}break;
        case MSProjectModelBooksType:{codeString = @"\uf02d";}break;
        case MSProjectModeliTunesType:{codeString = @"\uf179";}break;
        case MSProjectModelComputerType:{codeString = @"\uf108";}break;
        case MSProjectModelGiftType:{codeString = @"\uf06b";}break;
        case MSProjectModelKidsType:{codeString = @"\uf1ae";}break;
        case MSProjectModelHouseType:{codeString = @"\uf0c0";}break;
        case MSProjectModelJuiceType:{codeString = @"\uf0f4";}break;
        case MSProjectModelShoppingType:{codeString = @"\uf07a";}break;
        case MSProjectModelTravelType:{codeString = @"\uf006";}break;
        case MSProjectModelFitnessType:{codeString = @"\uf1e3";}break;
        case MSProjectModelClothType:{codeString = @"\uf1e9";}break;
        case MSProjectModelMobileType:{codeString = @"\uf10b";}break;
        default:{return [MSProjectModelTypeHelper projectModelTypeToImage:MSProjectModelUnkonwType
                                                                     size:size
                                                               hightlight:hightlight];}
    }
    FAKIcon *icon = [FAKFontAwesome iconWithCode:codeString size:fontSize];
    UIColor *iconColor = hightlight?[UIColor ms_DefaultColor]:[UIColor grayColor];
    [icon addAttribute:NSForegroundColorAttributeName value:iconColor];
    return [icon imageWithSize:size];
}




@end