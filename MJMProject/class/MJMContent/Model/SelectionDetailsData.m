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
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
   
    NSArray *array1 = @[@"科幻",@"爱情",@"乡村",@"喜剧",@"恐怖",@"刑侦",@"家庭",@"家庭"];
    NSString *array1_title = @"类型";
    NSString *array1_Detailtitle = @"美剧类型";
    NSArray *array2 = @[@"2015",@"2014",@"2013",@"2012",@"2011",@"2010",@"2009"];
    NSString *array2_title = @"时间";
    NSString *array2_Detailtitle = @"首播时间";
    NSArray *array3 = @[@"最新",@"最热",@"点击最多"];
    NSString *array3_title = @"程度";
    NSString *array3_Detailtitle = @"点击程度";
    [self makedatawithDataarray:array1 title:array1_title detailtitle:array1_Detailtitle dataarray:data];
    [self makedatawithDataarray:array2 title:array2_title detailtitle:array2_Detailtitle dataarray:data];
    [self makedatawithDataarray:array3 title:array3_title detailtitle:array3_Detailtitle dataarray:data];
    return data;
}

-(void)makedatawithDataarray:(NSArray *)array title:(NSString *)title detailtitle:(NSString *)detailtitle dataarray:(NSMutableArray *)dataarray
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:array forKey:@"selection_data"];//类别
    [dictionary setObject:title forKey:@"selection_title"];//小标题
    [dictionary setObject:detailtitle forKey:@"selection_detailtitle"];//详细标题
    [dataarray addObject:dictionary];
}

-(NSMutableArray *)makeSelectionData
{
    NSMutableArray *data_array = [self makeSelectionDetailsData];
    NSMutableArray *selection_datas = [[NSMutableArray alloc] init];
    for (int i=0; i<data_array.count; i++) {
        NSMutableDictionary *titles_dic = [[NSMutableDictionary alloc] init];
        NSString *first_data = [data_array[i] objectForKey:@"selection_data"][0];
        NSString *dic_title = [data_array[i] objectForKey:@"selection_detailtitle"];
        [titles_dic setObject:first_data forKey:@"first_data"];
        [titles_dic setObject:dic_title forKey:@"selection_title"];
        [selection_datas addObject:titles_dic];
    }
    return selection_datas;
}
@end
