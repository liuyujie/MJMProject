//
//  MainData.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MainData.h"

@implementation MainData

/***************************
 
 根据options（美剧类型、首播时间、公司）
 type（最新、点击最多、评分最高）
 index（已展示的数据 数目）
 
 获取一个美剧类目
 
 ***************************/
-(NSMutableDictionary *)getMoreDataWithOptions:(NSArray *)options type:(NSString *)type index:(NSInteger)index
{
    NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];

    NSString *pic_property = @"flash2.jpg";

    
    NSMutableDictionary *name_dic = [[NSMutableDictionary alloc] init];
    NSString *name_property = @"美剧名";
    NSString *name_value = @"闪电侠";
    [name_dic setObject:name_property forKey:@"property"];
    [name_dic setObject:name_value forKey:@"value"];
    
    NSMutableDictionary *state_dic = [[NSMutableDictionary alloc] init];
    NSString *state_property = @"播出状态";
    NSString *state_value = @"播出中";
    [state_dic setObject:state_property forKey:@"property"];
    [state_dic setObject:state_value forKey:@"value"];
    
    NSMutableDictionary *company_dic = [[NSMutableDictionary alloc] init];
    NSString *company_property = @"发行公司";
    NSArray *company_value = @[@"ABC"];
    [company_dic setObject:company_property forKey:@"property"];
    [company_dic setObject:company_value forKey:@"values"];
    
    NSMutableDictionary *episode_dic = [[NSMutableDictionary alloc] init];
    NSString *episode_property = @"已播出至";
    NSString *episode_value = @"第5季 第3集";
    [episode_dic setObject:episode_property forKey:@"property"];
    [episode_dic setObject:episode_value forKey:@"value"];
    
    NSMutableDictionary *grade_dic = [[NSMutableDictionary alloc] init];
    NSString *grade_property = @"总评分";
    NSString *grade_value = @"9.7";
    [grade_dic setObject:grade_property forKey:@"property"];
    [grade_dic setObject:grade_value forKey:@"value"];
    
    [properties setObject:pic_property forKey:@"pic_property"];
    [properties setObject:name_dic forKey:@"drama_name"];
    [properties setObject:state_dic forKey:@"state_dic"];
    [properties setObject:company_dic forKey:@"company_dic"];
    [properties setObject:episode_dic forKey:@"episode_dic"];
    [properties setObject:grade_dic forKey:@"grade_dic"];
    
    NSArray *list_Array = @[@"pic_property",@"drama_name",@"grade_dic",@"state_dic",@"episode_dic",@"company_dic"];
    [properties setObject:list_Array forKey:@"info_list"];
    
    return properties;
}

/***************************
 
 获取一定数量的美剧信息
 
 ***************************/
-(NSMutableArray *)makeContentMoreDramasWithOptions:(NSArray *)options type:(NSString *)type index:(NSInteger)index
{
    //假设没有信息了
    if (index > 0) {
        return nil;
    }
    else
    {
        NSMutableArray *Arrays = [[NSMutableArray alloc] init];
        
        for (int i=0; i<10; i++) {
            NSMutableDictionary *dic = [self getMoreDataWithOptions:options type:type index:index];
            [Arrays addObject:dic];
        }
        return Arrays;
    }
}

-(NSMutableArray *)makeMaindataWithOptions:(NSArray *)options
{
    NSMutableArray *main_data = [[NSMutableArray alloc] init];
    
    if ([options[0] isEqualToString:@"科幻"]) {
        [self makePropertyDicWithproperty:@"最新" mark:@"8.6" name:@"呵呵" pic:@"dog.jpg" aimArray:main_data];
        [self makePropertyDicWithproperty:@"点击最多" mark:@"6.2" name:@"杰米福克斯秀" pic:@"dog.jpg" aimArray:main_data];
        [self makePropertyDicWithproperty:@"评分最高" mark:@"9.3" name:@"闪电侠" pic:@"dog.jpg" aimArray:main_data];
    }
    else
    {
        [self makePropertyDicWithproperty:@"最新" mark:@"8.6" name:@"闪电侠" pic:@"flash.jpg" aimArray:main_data];
        [self makePropertyDicWithproperty:@"点击最多" mark:@"6.2" name:@"杰米福克斯秀" pic:@"flash.jpg" aimArray:main_data];
        [self makePropertyDicWithproperty:@"评分最高" mark:@"9.3" name:@"闪电侠" pic:@"flash.jpg" aimArray:main_data];
    }
    return main_data;
    
}

-(void)makePropertyDicWithproperty:(NSString *)property mark:(NSString *)mark name:(NSString *)name pic:(NSString *)pic aimArray:(NSMutableArray *)aimArray
{
    NSMutableDictionary *property_dic = [[NSMutableDictionary alloc] init];

    NSMutableArray *dramas_Array = [[NSMutableArray alloc] init];
    
    for (int i=0; i<8; i++) {
        NSMutableDictionary *values = [[NSMutableDictionary alloc] init];
        
        [values setObject:mark forKey:@"drama_mark"];
        [values setObject:name forKey:@"drama_name"];
        [values setObject:pic forKey:@"drama_pic"];
        [values setObject:@"23232" forKey:@"drama_keyID"];
        
        [dramas_Array addObject:values];
    }

    [property_dic setObject:property forKey:@"dramas_proerty"];
    [property_dic setObject:dramas_Array forKey:@"dramas_value_Array"];
    
    [aimArray addObject:property_dic];
}

@end
