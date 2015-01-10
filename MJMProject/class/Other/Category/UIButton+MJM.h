//
//  UIButton+MJM.h
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MJM)
-(void)layersforButton:(UIButton *)button WithCornerRadius:(CGFloat)CornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth ifMask:(BOOL)ifMask;
-(void)titleNolmalStateDetailsForButton:(UIButton *)button Withframe:(CGRect)frame fatherView:(UIView *)fatherView  Title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font;
@end
