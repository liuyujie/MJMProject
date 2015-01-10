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
    NSString *array1_title = @"美剧类型";
    NSString *array1_title_simple = @"类型";
    NSArray *array2 = @[@"2015",@"2014",@"2013",@"2012",@"2011",@"2010",@"2009"];
    NSString *array2_title = @"首播时间";
    NSString *array2_title_simple = @"时间";
    NSArray *array3 = @[@"最新",@"最热",@"点击最多"];
    NSString *array3_title = @"美剧排序";
    NSString *array3_title_simple = @"排序";
    [self makedatawithDataarray:array1 title:array1_title simpletitle:array1_title_simple dataarray:data];
    [self makedatawithDataarray:array2 title:array2_title simpletitle:array2_title_simple dataarray:data];
    [self makedatawithDataarray:array3 title:array3_title simpletitle:array3_title_simple dataarray:data];
    return data;
}

/***************************
 
 selectionDetails 的数据
 
 ***************************/

-(void)makedatawithDataarray:(NSArray *)array title:(NSString *)title simpletitle:(NSString *)simpletitle dataarray:(NSMutableArray *)dataarray
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:array forKey:@"selection_data"];
    [dictionary setObject:title forKey:@"selection_title"];
    [dictionary setObject:simpletitle forKey:@"selection_title_simple"];
    [dataarray addObject:dictionary];
}
/***************************
 
 selectionView 的数据
 
 ***************************/
-(NSMutableArray *)makeSelectionData
{
    NSMutableArray *data_array = [self makeSelectionDetailsData];
    NSMutableArray *selection_datas = [[NSMutableArray alloc] init];
    for (int i=0; i<data_array.count; i++) {
        NSMutableDictionary *titles_dic = [[NSMutableDictionary alloc] init];
        NSString *first_data = [data_array[i] objectForKey:@"selection_data"][0];
        NSString *dic_title_simple = [data_array[i] objectForKey:@"selection_title_simple"];
        
        [titles_dic setObject:first_data forKey:@"first_data"];
        [titles_dic setObject:dic_title_simple forKey:@"title_simple"];
        [selection_datas addObject:titles_dic];
    }
    return selection_datas;
}
@end
