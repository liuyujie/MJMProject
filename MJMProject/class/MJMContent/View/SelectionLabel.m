//
//  SelectionLabel.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SelectionLabel.h"

@implementation SelectionLabel

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
