//
//  UIImage+MoneySaver.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIImage+MoneySaver.h"
#import <FontAwesomeKit/FAKFontAwesome.h>
#import <objc/runtime.h>

NSString *MSCustomIconTypeToString(MSCustomIconType type)
{
    switch (type) {
        case MSCustomBackIcon:return @"\uf053";
        case MSCustomCloseIcon:return @"\uf00d";
        case MSCustomNoteIcon:return @"\uf040";
        case MSCustomCalendarIcon:return @"\uf073";
        case MSCustomChartIcon:return @"\uf200";
        default:return @"";
    }
}

@implementation UIImage (MoneySaver)

+ (instancetype)imageWithCode:(NSString *)code size:(CGFloat)size tintColor:(UIColor *)color
{
    if (color == nil) {
        color = [UIColor darkGrayColor];
    }
    FAKFontAwesome *icon = [FAKFontAwesome iconWithCode:code size:size];
    [icon addAttribute:NSForegroundColorAttributeName value:color];
    return [icon imageWithSize:CGSizeMake(size, size)];

}

+ (instancetype)imageWithType:(MSCustomIconType)type size:(CGFloat)size tintColor:(UIColor *)color
{
    NSString *code = MSCustomIconTypeToString(type);
    return [UIImage imageWithCode:code size:size tintColor:color];
}

@end


static char const * const kaRGBBitmapContextName = "aRGBBitmapContext";

@implementation UIImage (Baseoperation)

#pragma mark - Getter
- (CGContextRef)aRGBBitmapContext
{
    NSValue *value = objc_getAssociatedObject(self, kaRGBBitmapContextName);
    CGContextRef ref;
    [value getValue:&ref];
    return ref;
}


#pragma mark - Setter
- (void)setARGBBitmapContext:(CGContextRef)aRGBBitmapContext
{
    NSValue *value = [NSValue valueWithBytes:aRGBBitmapContext objCType:@encode(CGContextRef)];
    objc_setAssociatedObject(self, kaRGBBitmapContextName, value , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Public Method
- (CGContextRef) createARGBBitmapContextFromImage
{
    
    CGImageRef      inImage = self.CGImage;
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    

    bitmapBytesPerRow   = (int)(pixelsWide * 4);
    bitmapByteCount     = (int)(bitmapBytesPerRow * pixelsHigh);
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    CGColorSpaceRelease( colorSpace );
    
    return context;
}



- (UIColor *)getPixelColorAtLocation:(CGPoint)point
{
    UIColor* color = nil;
    CGImageRef inImage = self.CGImage;
    CGContextRef cgctx = [self createARGBBitmapContextFromImage];
    if (cgctx == NULL) {
        return nil; /* error */
    }
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    CGContextDrawImage(cgctx, rect, inImage);
    
    unsigned char* data = CGBitmapContextGetData (cgctx);
    if (data != NULL) {
        int offset = 4*((w*round(point.y))+round(point.x));
        int alpha =  data[offset];
        int red = data[offset+1];
        int green = data[offset+2];
        int blue = data[offset+3];
        color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
        
    }
    
    CGContextRelease(cgctx);
    if (data) { free(data); }
    return color;
}

- (UIImage *)scaleImageToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

@end