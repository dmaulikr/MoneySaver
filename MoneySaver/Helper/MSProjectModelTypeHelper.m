//
//  MSBaseProjectModelTypeHelper.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectModelTypeHelper.h"
#import <FontAwesomeKit/FAKFontAwesome.h>

@implementation MSProjectModelTypeHelper



+ (NSString *)projectModelTypeToChinese:(MSProjectModelType)type;
{
    switch (type) {
        case MSProjectModelUnkonwType:{return @"未知";}
        case MSProjectModelTypeIncomeType:{return @"收入";}
        case MSProjectModelTypeGeneralType:{return @"通用";}
        case MSProjectModelTypeHotelType:{return @"住宿";}
        case MSProjectModelTypeMakeUpType:{return @"化妆";}
        case MSProjectModelTypeMedicalType:{return @"药品";}
        case MSProjectModelTypePersonalType:{return @"个人";}
        case MSProjectModelTypeAppType:{return @"APP";}
        case MSProjectModelTypePetType:{return @"宠物";}
        case MSProjectModelTypeTrafficType:{return @"交通";}
        case MSProjectModelTypeCarType:{return @"汽车";}
        case MSProjectModelTypeMovieType:{return @"电影";}
        case MSProjectModelTypeFoodType:{return @"食品";}
        case MSProjectModelTypeBooksType:{return @"书籍";}
        case MSProjectModelTypeiTunesType:{return @"iTunes";}
        case MSProjectModelTypeComputerType:{return @"电脑";}
        case MSProjectModelTypeGiftType:{return @"礼物";}
        case MSProjectModelTypeKidsType:{return @"儿童";}
        case MSProjectModelTypeHouseType:{return @"家庭";}
        case MSProjectModelTypeJuiceType:{return @"饮料";}
        case MSProjectModelTypeShoppingType:{return @"购物";}
        case MSProjectModelTypeTravelType:{return @"节日";}
        case MSProjectModelTypeFitnessType:{return @"健身";}
        case MSProjectModelTypeClothType:{return @"衣服";}
        case MSProjectModelTypeMobileType:{return @"手机";}
        default:return [MSProjectModelTypeHelper projectModelTypeToChinese:MSProjectModelUnkonwType];
    }
}

+ (UIImage *)projectModelTypeToImage:(MSProjectModelType)type size:(CGSize)size hightlight:(BOOL)hightlight
{
    FAKIcon *icon = nil;
    CGFloat fontSize = MIN(size.width, size.height);
    switch (type) {
        case MSProjectModelUnkonwType:{icon = [FAKIcon iconWithCode:@"\uf128" size:fontSize];}
        case MSProjectModelTypeIncomeType:{icon = [FAKIcon iconWithCode:@"\uf019" size:fontSize];}
        case MSProjectModelTypeGeneralType:{icon = [FAKIcon iconWithCode:@"\uf02b" size:fontSize];}
        case MSProjectModelTypeHotelType:{icon = [FAKIcon iconWithCode:@"\uf236" size:fontSize];}
        case MSProjectModelTypeMakeUpType:{icon = [FAKIcon iconWithCode:@"\uf182" size:fontSize];}
        case MSProjectModelTypeMedicalType:{icon = [FAKIcon iconWithCode:@"\uf0c3" size:fontSize];}
        case MSProjectModelTypePersonalType:{icon = [FAKIcon iconWithCode:@"\uf007" size:fontSize];}
        case MSProjectModelTypeAppType:{icon = [FAKIcon iconWithCode:@"\uf099" size:fontSize];}
        case MSProjectModelTypePetType:{icon = [FAKIcon iconWithCode:@"\uf1b0" size:fontSize];}
        case MSProjectModelTypeTrafficType:{icon = [FAKIcon iconWithCode:@"\uf1b9" size:fontSize];}
        case MSProjectModelTypeCarType:{icon = [FAKIcon iconWithCode:@"\uf0e4" size:fontSize];}
        case MSProjectModelTypeMovieType:{icon = [FAKIcon iconWithCode:@"\uf008" size:fontSize];}
        case MSProjectModelTypeFoodType:{icon = [FAKIcon iconWithCode:@"\uf0f5" size:fontSize];}
        case MSProjectModelTypeBooksType:{icon = [FAKIcon iconWithCode:@"\uf02d" size:fontSize];}
        case MSProjectModelTypeiTunesType:{icon = [FAKIcon iconWithCode:@"\uf179" size:fontSize];}
        case MSProjectModelTypeComputerType:{icon = [FAKIcon iconWithCode:@"\uf108" size:fontSize];}
        case MSProjectModelTypeGiftType:{icon = [FAKIcon iconWithCode:@"\uf06b" size:fontSize];}
        case MSProjectModelTypeKidsType:{icon = [FAKIcon iconWithCode:@"\uf1ae" size:fontSize];}
        case MSProjectModelTypeHouseType:{icon = [FAKIcon iconWithCode:@"\uf0c0" size:fontSize];}
        case MSProjectModelTypeJuiceType:{icon = [FAKIcon iconWithCode:@"\uf0f4" size:fontSize];}
        case MSProjectModelTypeShoppingType:{icon = [FAKIcon iconWithCode:@"\uf07a" size:fontSize];}
        case MSProjectModelTypeTravelType:{icon = [FAKIcon iconWithCode:@"\uf006" size:fontSize];}
        case MSProjectModelTypeFitnessType:{icon = [FAKIcon iconWithCode:@"\uf0e7" size:fontSize];}
        case MSProjectModelTypeClothType:{icon = [FAKIcon iconWithCode:@"\uf21d" size:fontSize];}
        case MSProjectModelTypeMobileType:{icon = [FAKIcon iconWithCode:@"\uf10b" size:fontSize];}
        default:{icon = [FAKIcon iconWithCode:@"\uf128" size:fontSize];}
    }
    UIColor *iconColor = hightlight?[UIColor darkGrayColor]:[UIColor whiteColor];
    [icon addAttribute:NSForegroundColorAttributeName value:iconColor];
    return [icon imageWithSize:size];
}




@end