//
//  MainData.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MainData.h"

@implementation MainData

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
