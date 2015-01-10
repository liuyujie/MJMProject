//
//  UIView+MJM.m
//  MJMProject
//
//  Created by bassamyan on 15/1/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIView+MJM.h"

@implementation UIView (MJM)


-(UIView *)makeLinesWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor fatherView:(UIView *)fatherView
{
    UIView *line_view = [[UIView alloc] init];
    line_view.frame = frame;
    line_view.backgroundColor = lineColor;
    [fatherView addSubview:line_view];
    
    return line_view;
}

-(CGRect)calculateSizeWithFont:(NSInteger)Font Width:(CGFloat)Width Height:(CGFloat)Height Text:(NSString *)Text
{
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:Font]};
    return [self calculateSizewithText:(NSString *)Text LimitWidth:(CGFloat)Width LimitHeight:(CGFloat)Height Attribute:(NSDictionary *)attr];
}

-(CGFloat)calculateHeightWithText:(NSString *)Text TextFont:(CGFloat)Font LimitWidth:(CGFloat)Width
{
    return [self calculateSizeWithFont:Font Width:Width Height:MAXFLOAT Text:Text].size.height;
}

-(CGFloat)calculateWidthWithText:(NSString *)Text TextFont:(CGFloat)Font LimitHeight:(CGFloat)Height
{
    return [self calculateSizeWithFont:Font Width:MAXFLOAT Height:Height Text:Text].size.width;
}

-(CGRect)calculateSizeWithText:(NSString *)Text TextFont:(CGFloat)Font
{
    return [self calculateSizeWithFont:Font Width:MAXFLOAT Height:MAXFLOAT Text:Text];
}

-(CGRect)calculateSizewithText:(NSString *)Text LimitWidth:(CGFloat)Width LimitHeight:(CGFloat)Height Attribute:(NSDictionary *)attr
{
    CGRect size = [Text boundingRectWithSize:CGSizeMake(Width, Height)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil];
    return size;
}


@end
