//
//  ContentSelectionButton.m
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionButton.h"

@interface ContentSelectionButton()
@end

@implementation ContentSelectionButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 20;
    CGFloat imageX = 5;
    CGFloat imageH = imageW;
    CGFloat imageY = 5;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
