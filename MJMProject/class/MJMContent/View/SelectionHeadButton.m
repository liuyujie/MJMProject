//
//  SelectionHeadButton.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SelectionHeadButton.h"
#import "UIImage+MJM.h"

@implementation SelectionHeadButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeHeadImageview];
    }
    return self;
}

-(void)makeHeadImageview
{
    UIButton *circle = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.height-10, self.frame.size.width-10)];
    UIView *circle_border = [[UIView alloc]initWithFrame:CGRectMake(2, 2, circle.frame.size.width + 6, circle.frame.size.height + 6)];
    
    [circle setBackgroundImage:[UIImage resizedImageWithName:@"head.jpg"] forState:0];
    
    circle_border.layer.cornerRadius = circle_border.frame.size.height/2;
    circle.layer.cornerRadius = circle.frame.size.height/2;
    circle.backgroundColor = [UIColor whiteColor];
    circle_border.backgroundColor = main_color;
    [circle.layer setMasksToBounds:YES];
    
    [self addSubview:circle_border];
    [self addSubview:circle];
    
    [circle addTarget:self
             action:@selector(headImageviewClick)
   forControlEvents:1 << 6];
}

-(void)headImageviewClick
{
    if ([self.delegate respondsToSelector:@selector(headImageClickWithPersoninfo:)]) {
        [self.delegate headImageClickWithPersoninfo:@"1212"];
    }
}

@end
