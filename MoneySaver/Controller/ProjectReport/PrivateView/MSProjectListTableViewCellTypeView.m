//
//  MSProjectListTableViewCellTypeView.m
//  MoneySaver
//
//  Created by Tbxark on 15/9/26.
//  Copyright © 2015年 TBXark. All rights reserved.
//

#import "MSProjectListTableViewCellTypeView.h"



@implementation MSProjectListTableViewCellTypeView

- (void)drawRect:(CGRect)rect
{
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGPoint star = CGPointMake(kRadiusForTypeCircle, 0);
    CGPoint end  = CGPointMake(kRadiusForTypeCircle, CGRectGetHeight(rect));
    CGPoint points[] = {star,end};
    CGContextAddLines(contex, points, 2);
    CGContextSetLineWidth(contex, kLineWidthForTypeView);
    [[UIColor grayColor] set];
    CGContextStrokePath(contex);
    
    [[UIColor whiteColor] setStroke];
    [self.typeColor setFill];
    CGContextAddEllipseInRect(contex, CGRectMake(0, CGRectGetHeight(rect)-kRadiusForTypeCircle, kRadiusForTypeCircle*2, kRadiusForTypeCircle*2));
    CGContextStrokePath(contex);
    CGContextFillPath(contex);
}

- (void)setTypeColor:(UIColor *)typeColor
{
    _typeColor = typeColor;
    [self setNeedsDisplay];
}

@end
