//
//  CellData.m
//  MJMProject
//
//  Created by bassamyan on 15/1/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CellData.h"

@interface CellData()
@property (nonatomic,strong) NSMutableArray *list_array;
@end

@implementation CellData

-(NSMutableArray *)makeCelldatawithoptions:(NSArray *)options
{
    NSMutableArray *all_array = [[NSMutableArray alloc] init];
    
    
    for (int i=0; i<3; i++) {
        NSMutableDictionary *sub_dic = [[NSMutableDictionary alloc] init];
        NSMutableArray *list_array = [[NSMutableArray alloc] init];
        /***************
         
         美剧名称
         
         ***************/
        NSString *head_title_CHN = @"闪电侠";
        [sub_dic setObject:head_title_CHN forKey:@"head_title_CHN"];
        
        /***************
         
         美剧名称(英语)
         
         ***************/
        NSString *head_title_ENG = @"The Flash";
        [sub_dic setObject:head_title_ENG forKey:@"head_title_ENG"];
        
        /***************
         
         导演
         
         ***************/
        NSMutableDictionary *directors_dic = [[NSMutableDictionary alloc] init];
        directors_dic = [self makedicWithproperty:@"导演" value:nil values:@[@"彼得 斯派瑞",@"彼得 斯派",@"卡类 斯派瑞",@"彼得 斯派瑞",@"彼得 斯派瑞"]];
        [sub_dic setObject:directors_dic forKey:@"head_directors"];
        
        /***************
         
         编剧
         
         ***************/
        NSMutableDictionary *scriptwriter_dic = [[NSMutableDictionary alloc] init];
        scriptwriter_dic = [self makedicWithproperty:@"编剧" value:nil values:@[@"威尔 古勒"]];
        [sub_dic setObject:scriptwriter_dic forKey:@"head_scriptwriter"];
        
        /***************
         
         主演
         
         ***************/
        NSMutableDictionary *actor_dic = [[NSMutableDictionary alloc] init];
        actor_dic = [self makedicWithproperty:@"主演" value:nil values:@[@"杰米 福克斯"]];
        [sub_dic setObject:actor_dic forKey:@"head_actor"];
        
        /***************
         
         类型
         
         ***************/
        NSMutableDictionary *type_dic = [[NSMutableDictionary alloc] init];
        type_dic = [self makedicWithproperty:@"类型" value:@"家庭" values:nil];
        [sub_dic setObject:type_dic forKey:@"head_type"];
        
        /***************
         
         首播日期
         
         ***************/
        NSMutableDictionary *publish_time_dic = [[NSMutableDictionary alloc] init];
        publish_time_dic = [self makedicWithproperty:@"首播日期" value:@"2015-1-1" values:nil];
        [sub_dic setObject:publish_time_dic forKey:@"head_publishtime"];
        
        /***************
         
         已播至
         
         ***************/
        NSMutableDictionary *now_episode_dic = [[NSMutableDictionary alloc] init];
        now_episode_dic = [self makedicWithproperty:@"已播至" value:@"第五季 第十三集" values:nil];
        [sub_dic setObject:now_episode_dic forKey:@"head_nowepisode"];
        
        /***************
         
         播出状态
         
         ***************/
        NSMutableDictionary *state_dic = [[NSMutableDictionary alloc] init];
        state_dic = [self makedicWithproperty:@"状态" value:@"播出中" values:nil];
        [sub_dic setObject:state_dic forKey:@"head_state"];
        
        _list_array = list_array;
        [all_array addObject:sub_dic];
    }
    return all_array;
}

-(NSMutableDictionary *)makedicWithproperty:(NSString *)property value:(NSString *)value values:(NSArray *)values
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *property_local = property;
    NSString *value_local = value;
    NSArray *values_local = values;
    if (value_local == nil && values_local!= nil) {
        [dic setObject:property_local forKey:@"head_name"];
        [dic setObject:values_local forKey:@"head_datas"];
    }
    else if(value_local != nil && values_local== nil)
    {
        [dic setObject:property_local forKey:@"head_name"];
        [dic setObject:value_local forKey:@"head_data"];
    }
    return dic;
}
@end
