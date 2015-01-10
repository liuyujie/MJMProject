//
//  UILabel+MJM.m
//  MJMProject
//
//  Created by bassamyan on 15/1/10.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UILabel+MJM.h"

@implementation UILabel (MJM)
-(void)labelWithlabel:(UILabel *)label frame:(CGRect)frame font:(CGFloat)font text:(NSString *)text textColor:(UIColor *)textColor fatherView:(UIView *)fatherView
{
    label.frame = frame;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    [fatherView addSubview:label];
}

-(void)attitudeButtonClicked:(NSNotification *)noti
{
    if (self.tag == [[noti.userInfo objectForKey:@"attitude_btn"] integerValue]) {
        self.text = [NSString stringWithFormat:@"%d",[self.text intValue]+1];
    }
}

-(void)selectionClicked:(NSNotification *)noti
{
    if ((int)self.tag == [[noti.userInfo objectForKey:@"select_index"] intValue]) {
        NSString *selec_name = [noti.userInfo objectForKey:@"select_name"];
        self.text = selec_name;
        
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.8]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.6];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4 :1.3 :1 :1]];
        [self.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
}
@end
