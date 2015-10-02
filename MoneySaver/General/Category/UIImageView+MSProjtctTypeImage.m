//
//  UIImageView+MSProjtctTypeImage.m
//  MoneySaver
//
//  Created by Tbxark on 15/10/2.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "UIImageView+MSProjtctTypeImage.h"
#import "MSProjectModelTypeHelper.h"
#import <objc/runtime.h>

static char const * const kMSProjectModelTypeProperty = "MSProjectModelType";

@implementation UIImageView (MSProjtctTypeImage)

#pragma mark - Private Method
- (void)configureTypeChange
{
    self.image = [MSProjectModelTypeHelper projectModelTypeToImage:self.projectType
                                                              size:self.bounds.size
                                                        hightlight:NO];
    
    self.highlightedImage = [MSProjectModelTypeHelper projectModelTypeToImage:self.projectType
                                                                         size:self.bounds.size
                                                                   hightlight:YES];
}


#pragma mark - Binding Property

- (void)setProjectType:(MSProjectModelType)projectType
{
    if (self.projectType != projectType) {
        objc_setAssociatedObject(self, kMSProjectModelTypeProperty, @(projectType) , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self configureTypeChange];
    }
}

- (MSProjectModelType)projectType
{
    NSNumber *type = objc_getAssociatedObject(self, kMSProjectModelTypeProperty);
    return type.unsignedIntegerValue;
}

@end
