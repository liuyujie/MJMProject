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
-(NSDictionary *)getMoreDataWithOptions:(NSArray *)options type:(NSString *)type index:(NSInteger)index
{
    NSDictionary *dic = @{@"pic_property":@"flash2.jpg",
                          @"drama_dic"   :@{@"property":@"美剧名",@"value":@"闪电侠"},
                          @"grade_dic"   :@{@"property":@"总评分",@"value":@"9.7"},
                          @"state_dic"   :@{@"property":@"播出状态",@"value":@"播出中"},
                          @"episode_dic" :@{@"property":@"已播出至",@"value":@"第5季 第3集"},
                          @"company_dic" :@{@"property":@"发行公司",@"values":@[@"ABC"]}
                          };
    return dic;
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
            NSDictionary *dic = [self getMoreDataWithOptions:options type:type index:index];
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
