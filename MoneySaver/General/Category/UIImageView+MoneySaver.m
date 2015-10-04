//
//  UIImageView+MSProjtctTypeImage.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIImageView+MoneySaver.h"
#import "MSProjectModelTypeHelper.h"
#import <objc/runtime.h>

#define kNeedAddPropertyForUIImageView

#ifdef kNeedAddPropertyForUIImageView
static char const * const kMSProjectModelTypeProperty = "MSProjectModelType";
#endif

@implementation UIImageView (MSProjtctTypeImage)
@dynamic projectType;

#pragma mark - Private Method

#pragma mark - Binding Property

- (void)setProjectType:(MSProjectModelType)projectType
{
#ifdef kNeedAddPropertyForUIImageView
    objc_setAssociatedObject(self, kMSProjectModelTypeProperty, @(projectType) , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
#endif
//    if (projectType != self.projectType) {
        @weakify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self);
            self.image = [MSProjectModelTypeHelper projectModelTypeToImage:projectType
                                                                      size:self.bounds.size
                                                                hightlight:NO];
            
            self.highlightedImage = [MSProjectModelTypeHelper projectModelTypeToImage:projectType
                                                                                 size:self.bounds.size
                                                                           hightlight:YES];
        });
//    }
}


#ifdef kNeedAddPropertyForUIImageView
- (MSProjectModelType)projectType
{
    NSNumber *type = objc_getAssociatedObject(self, kMSProjectModelTypeProperty);
    return type.unsignedIntegerValue;
}
#endif

@end
