//
//  SelectionDetailsData.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SelectionDetailsData.h"

@implementation SelectionDetailsData

-(NSMutableArray *)makeSelectionDetailsData
{
    NSMutableArray *selection_Array = [[NSMutableArray alloc] init];
    NSArray *values = @[@"爱情",@"喜剧",@"动作",@"恐怖",@"悬疑",@"科幻",@"灾难",@"战争",@"剧情",@"动画",@"音乐",@"纪录片",@"伦理",@"惊悚",@"奇幻",@"警匪",@"其他"];
    NSString *property = @"美剧类型";
    NSString *property_detailed = @"美剧类型";
    
    
    NSArray *values2 = @[@"2015",@"2014",@"2013",@"2012",@"2011",@"2010前",@"2005前",@"2000前"];
    NSString *property2 = @"首播时间";
    NSString *property_detailed2 = @"首播时间";
    
    
    [self makeSelectionInfoWithfatherArray:selection_Array valuesArray:values property:property property_detailed:property_detailed];
    [self makeSelectionInfoWithfatherArray:selection_Array valuesArray:values2 property:property2 property_detailed:property_detailed2];
    
    return selection_Array;
}

/***************************
 
 selectionDetails 的数据
 
 ***************************/

-(void)makeSelectionInfoWithfatherArray:(NSMutableArray *)fatherArray valuesArray:(NSArray *)valuesArray property:(NSString *)property property_detailed:(NSString *)property_detailed
{
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:valuesArray forKey:@"selection_valueArray"];
        [dic setObject:property forKey:@"selection_property"];
        [dic setObject:property_detailed forKey:@"selection_property_detailed"];
        [fatherArray addObject:dic];
}

@end
