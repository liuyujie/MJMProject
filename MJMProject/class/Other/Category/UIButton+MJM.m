//
//  UIButton+MJM.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIButton+MJM.h"

@implementation UIButton (MJM)

-(void)layersforButton:(UIButton *)button WithCornerRadius:(CGFloat)CornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth ifMask:(BOOL)ifMask
{
    
    button.layer.cornerRadius = CornerRadius;
    button.layer.borderColor = [borderColor CGColor];
    button.layer.borderWidth = borderWidth;
    [button.layer setMasksToBounds:ifMask];
    
}

-(void)titleNolmalStateDetailsForButton:(UIButton *)button Withframe:(CGRect)frame fatherView:(UIView *)fatherView  Title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font
{
    button.frame = frame;
    [button setTitle:title forState:0];
    [button setTitleColor:titleColor forState:0];
    [button setBackgroundColor:backgroundColor];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [fatherView addSubview:button];
}

@end
