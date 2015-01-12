//
//  MainviewButton.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MainviewButton.h"

@implementation MainviewButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 20;
    CGFloat imageH = imageW;
    CGFloat imageX = self.frame.size.width - imageW - 5;
    CGFloat imageY = 5;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = self.frame.size.height;
    CGFloat titleW = 200;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
