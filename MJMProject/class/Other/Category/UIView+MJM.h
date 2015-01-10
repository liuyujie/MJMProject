//
//  UIView+MJM.h
//  MJMProject
//
//  Created by bassamyan on 15/1/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MJM)

/***********
 
 设置直线
 
 ************/
-(UIView *)makeLinesWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor fatherView:(UIView *)fatherView;

/***********
 
 计算文字大小
 
************/
-(CGRect)calculateSizeWithFont:(NSInteger)Font Width:(CGFloat)Width Height:(CGFloat)Height Text:(NSString *)Text;
-(CGFloat)calculateHeightWithText:(NSString *)Text TextFont:(CGFloat)Font LimitWidth:(CGFloat)Width;
-(CGFloat)calculateWidthWithText:(NSString *)Text TextFont:(CGFloat)Font LimitHeight:(CGFloat)Height;
-(CGRect)calculateSizeWithText:(NSString *)Text TextFont:(CGFloat)Font;
-(CGRect)calculateSizewithText:(NSString *)Text LimitWidth:(CGFloat)Width LimitHeight:(CGFloat)Height Attribute:(NSDictionary *)attr;
@end
