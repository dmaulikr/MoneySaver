//
//  UIImage+MoneySaver.h
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MSCustomIconType) {
    MSCustomBackIcon,
    MSCustomCloseIcon,
    MSCustomNoteIcon,
    MSCustomCalendarIcon,
    MSCustomChartIcon,
};

@interface UIImage (MoneySaver)

+ (instancetype)imageWithCode:(NSString *)code size:(CGFloat)size tintColor:(UIColor *)color;
+ (instancetype)imageWithType:(MSCustomIconType)type size:(CGFloat)size tintColor:(UIColor *)color;


@end

@interface UIImage (Baseoperation)

@property (nonatomic, assign) CGContextRef aRGBBitmapContext;

- (UIColor *)getPixelColorAtLocation:(CGPoint)point;
- (UIImage *)scaleImageToSize:(CGSize)size;


@end
