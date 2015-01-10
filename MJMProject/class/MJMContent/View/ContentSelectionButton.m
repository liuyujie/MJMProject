//
//  ContentSelectionButton.m
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionButton.h"
#import "UIImage+MJM.h"

@interface ContentSelectionButton()
@end

@implementation ContentSelectionButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self makeSelectionbuttonWithframe:frame];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 15;
    CGFloat imageX = 5;
    CGFloat imageH = imageW;
    CGFloat imageY = (self.frame.size.height - imageH)/2;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(void)makeSelectionbuttonWithframe:(CGRect)frame
{
    self.frame = frame;
    [self setBackgroundColor:[UIColor clearColor]];
    [self setImage:[UIImage resizedImageWithName:@"arrow_mainColor.png"] forState:0];
    [self setImage:[UIImage resizedImageWithName:@"arrow_mainColor.png"] forState:1 << 0];
    self.imageView.contentMode = UIViewContentModeCenter;
    [self addTarget:self
               action:@selector(selectionbtnDidClickedwithbutton:)
     forControlEvents:1 << 6];
}

-(void)selectionbtnDidClickedwithbutton:(ContentSelectionButton *)button
{
    if ([self.delegate respondsToSelector:@selector(selectionbuttonDidClickedWithbutton:)]) {
        [self.delegate selectionbuttonDidClickedWithbutton:button];
    }
}
@end
