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
    FAKIcon *icon = nil;
    CGFloat fontSize = MIN(size.width, size.height);
    switch (type) {
        case MSProjectModelUnkonwType:{icon = [FAKFontAwesome iconWithCode:@"\uf128" size:fontSize];}break;
        case MSProjectModelIncomeType:{icon = [FAKFontAwesome iconWithCode:@"\uf019" size:fontSize];}break;
        case MSProjectModelGeneralType:{icon = [FAKFontAwesome iconWithCode:@"\uf02b" size:fontSize];}break;
        case MSProjectModelHotelType:{icon = [FAKFontAwesome iconWithCode:@"\uf1ad" size:fontSize];}break;
        case MSProjectModelMakeUpType:{icon = [FAKFontAwesome iconWithCode:@"\uf182" size:fontSize];}break;
        case MSProjectModelMedicalType:{icon = [FAKFontAwesome iconWithCode:@"\uf0c3" size:fontSize];}break;
        case MSProjectModelPersonalType:{icon = [FAKFontAwesome iconWithCode:@"\uf007" size:fontSize];}break;
        case MSProjectModelAppType:{icon = [FAKFontAwesome iconWithCode:@"\uf099" size:fontSize];}break;
        case MSProjectModelPetType:{icon = [FAKFontAwesome iconWithCode:@"\uf1b0" size:fontSize];}break;
        case MSProjectModelTrafficType:{icon = [FAKFontAwesome iconWithCode:@"\uf1b9" size:fontSize];}break;
        case MSProjectModelCarType:{icon = [FAKFontAwesome iconWithCode:@"\uf0e4" size:fontSize];}break;
        case MSProjectModelMovieType:{icon = [FAKFontAwesome iconWithCode:@"\uf008" size:fontSize];}break;
        case MSProjectModelFoodType:{icon = [FAKFontAwesome iconWithCode:@"\uf0f5" size:fontSize];}break;
        case MSProjectModelBooksType:{icon = [FAKFontAwesome iconWithCode:@"\uf02d" size:fontSize];}break;
        case MSProjectModeliTunesType:{icon = [FAKFontAwesome iconWithCode:@"\uf179" size:fontSize];}break;
        case MSProjectModelComputerType:{icon = [FAKFontAwesome iconWithCode:@"\uf108" size:fontSize];}break;
        case MSProjectModelGiftType:{icon = [FAKFontAwesome iconWithCode:@"\uf06b" size:fontSize];}break;
        case MSProjectModelKidsType:{icon = [FAKFontAwesome iconWithCode:@"\uf1ae" size:fontSize];}break;
        case MSProjectModelHouseType:{icon = [FAKFontAwesome iconWithCode:@"\uf0c0" size:fontSize];}break;
        case MSProjectModelJuiceType:{icon = [FAKFontAwesome iconWithCode:@"\uf0f4" size:fontSize];}break;
        case MSProjectModelShoppingType:{icon = [FAKFontAwesome iconWithCode:@"\uf07a" size:fontSize];}break;
        case MSProjectModelTravelType:{icon = [FAKFontAwesome iconWithCode:@"\uf006" size:fontSize];}break;
        case MSProjectModelFitnessType:{icon = [FAKFontAwesome iconWithCode:@"\uf1e3" size:fontSize];}break;
        case MSProjectModelClothType:{icon = [FAKFontAwesome iconWithCode:@"\uf1e9" size:fontSize];}break;
        case MSProjectModelMobileType:{icon = [FAKFontAwesome iconWithCode:@"\uf10b" size:fontSize];}break;
        default:{icon = [FAKFontAwesome iconWithCode:@"\uf128" size:fontSize];}
    }
    UIColor *iconColor = hightlight?[UIColor ms_RedColor]:[UIColor grayColor];
    [icon addAttribute:NSForegroundColorAttributeName value:iconColor];
    return [icon imageWithSize:size];
}




@end