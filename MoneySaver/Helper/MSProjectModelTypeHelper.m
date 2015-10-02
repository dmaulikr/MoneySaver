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
        case MSProjectModelUnkonwType:{icon = [FAKIcon iconWithCode:@"\uf128" size:fontSize];}
        case MSProjectModelIncomeType:{icon = [FAKIcon iconWithCode:@"\uf019" size:fontSize];}
        case MSProjectModelGeneralType:{icon = [FAKIcon iconWithCode:@"\uf02b" size:fontSize];}
        case MSProjectModelHotelType:{icon = [FAKIcon iconWithCode:@"\uf236" size:fontSize];}
        case MSProjectModelMakeUpType:{icon = [FAKIcon iconWithCode:@"\uf182" size:fontSize];}
        case MSProjectModelMedicalType:{icon = [FAKIcon iconWithCode:@"\uf0c3" size:fontSize];}
        case MSProjectModelPersonalType:{icon = [FAKIcon iconWithCode:@"\uf007" size:fontSize];}
        case MSProjectModelAppType:{icon = [FAKIcon iconWithCode:@"\uf099" size:fontSize];}
        case MSProjectModelPetType:{icon = [FAKIcon iconWithCode:@"\uf1b0" size:fontSize];}
        case MSProjectModelTrafficType:{icon = [FAKIcon iconWithCode:@"\uf1b9" size:fontSize];}
        case MSProjectModelCarType:{icon = [FAKIcon iconWithCode:@"\uf0e4" size:fontSize];}
        case MSProjectModelMovieType:{icon = [FAKIcon iconWithCode:@"\uf008" size:fontSize];}
        case MSProjectModelFoodType:{icon = [FAKIcon iconWithCode:@"\uf0f5" size:fontSize];}
        case MSProjectModelBooksType:{icon = [FAKIcon iconWithCode:@"\uf02d" size:fontSize];}
        case MSProjectModeliTunesType:{icon = [FAKIcon iconWithCode:@"\uf179" size:fontSize];}
        case MSProjectModelComputerType:{icon = [FAKIcon iconWithCode:@"\uf108" size:fontSize];}
        case MSProjectModelGiftType:{icon = [FAKIcon iconWithCode:@"\uf06b" size:fontSize];}
        case MSProjectModelKidsType:{icon = [FAKIcon iconWithCode:@"\uf1ae" size:fontSize];}
        case MSProjectModelHouseType:{icon = [FAKIcon iconWithCode:@"\uf0c0" size:fontSize];}
        case MSProjectModelJuiceType:{icon = [FAKIcon iconWithCode:@"\uf0f4" size:fontSize];}
        case MSProjectModelShoppingType:{icon = [FAKIcon iconWithCode:@"\uf07a" size:fontSize];}
        case MSProjectModelTravelType:{icon = [FAKIcon iconWithCode:@"\uf006" size:fontSize];}
        case MSProjectModelFitnessType:{icon = [FAKIcon iconWithCode:@"\uf0e7" size:fontSize];}
        case MSProjectModelClothType:{icon = [FAKIcon iconWithCode:@"\uf21d" size:fontSize];}
        case MSProjectModelMobileType:{icon = [FAKIcon iconWithCode:@"\uf10b" size:fontSize];}
        default:{icon = [FAKIcon iconWithCode:@"\uf128" size:fontSize];}
    }
    UIColor *iconColor = hightlight?[UIColor darkGrayColor]:[UIColor ms_RedColor];
    [icon addAttribute:NSForegroundColorAttributeName value:iconColor];
    return [icon imageWithSize:size];
}




@end