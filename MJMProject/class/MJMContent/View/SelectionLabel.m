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
        NSString *selec_title = [noti.userInfo objectForKey:@"select_title"];
        NSString *selection_click_string = [NSString stringWithFormat:@"%@/%@",selec_title,selec_name];
        self.text = selection_click_string;
    }
}
@end
