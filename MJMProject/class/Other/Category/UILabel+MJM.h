//
//  UILabel+MJM.h
//  MJMProject
//
//  Created by bassamyan on 15/1/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MJM)
-(void)attitudeButtonClicked:(NSNotification *)noti;
-(void)selectionClicked:(NSNotification *)noti;
-(void)labelWithlabel:(UILabel *)label frame:(CGRect)frame font:(CGFloat)font text:(NSString *)text textColor:(UIColor *)textColor fatherView:(UIView *)fatherView;
@end
