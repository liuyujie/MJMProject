//
//  ContentDetailCellFrame.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentDetailCellFrame.h"

@implementation ContentDetailCellFrame

-(NSInteger)calculateContentcellFrame
{
    NSInteger cell_head = 50;
    NSInteger cell_body = 200;
    NSInteger cell_foot = 30;
    
    NSInteger cell_total = cell_head+cell_body+cell_foot;
    return cell_total;
}

@end
