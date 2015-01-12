//
//  ContentDetailCellFrame.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentDetailCellFrame.h"
#import "UIImage+MJM.h"

@implementation ContentDetailCellFrame

-(NSInteger)calculateContentcellFrameWithDatadic:(NSMutableDictionary *)dic
{
    NSArray *list_array = @[@"head_directors",@"head_scriptwriter",@"head_actor",@"head_type",@"head_publishtime",@"head_nowepisode",@"head_state"];
    
    NSMutableArray *data_Array = [[NSMutableArray alloc] init];
    for (int i = 0; i < list_array.count; i++) {
        NSMutableDictionary *dics = [dic objectForKey:list_array[i]];
        [data_Array addObject:dics];
    }
    /***********
     
     头部的高度
     
     ***********/
    CGFloat lastObjectY = 40;
    CGFloat positionX = 115;
    for (int i = 0; i < data_Array.count; i++) {
        NSMutableDictionary *dic = data_Array[i];
        lastObjectY = [self makeMJMDetailesWithproperty:[dic objectForKey:@"head_name"]
                                                   data:[dic objectForKey:@"head_data"]
                                                  datas:[dic objectForKey:@"head_datas"]
                                            lastObjectY:lastObjectY
                                              positionX:positionX];
    }
    CGFloat head_height = 190;
    if (head_height < lastObjectY) {
        head_height = lastObjectY;
    }
    NSInteger cell_head = head_height+10;
    
    /***********
     
     内容的高度
     
     ***********/
    
    NSInteger cell_body = 200;
    
    /***********
     
     尾部的高度
     
     ***********/
    
    NSInteger cell_foot = 0;
    
    NSInteger cell_total = cell_head+cell_body+cell_foot;
    return cell_total;
}
/***************************
 
 计算label的高度
 
 ***************************/

-(CGFloat)makeMJMDetailesWithproperty:(NSString *)property
                                   data:(NSString *)data
                                  datas:(NSArray *)datas
                            lastObjectY:(CGFloat)lastObjectY
                              positionX:(CGFloat)positionX

{
    NSString *value_nostyle;
    NSString *text_output;
    if (data == nil && datas != nil) {
        value_nostyle      = [NSString stringWithFormat:@"%@ : ",property];
        for (int i=0; i<datas.count; i++) {
            text_output   = [NSString stringWithFormat:@"%@ / ",datas[i]];
            if (i == datas.count - 1) {
                text_output = datas[i];
            }
            value_nostyle = [value_nostyle stringByAppendingString:text_output];
        }
    }
    else if(data != nil && datas == nil)
    {
        value_nostyle = [NSString stringWithFormat:@"%@ : %@",property,data];
    }
    lastObjectY += [self calculateSizeWithFont:font_Main Width:MJMWIDTH-(positionX+25) Height:MAXFLOAT Text:value_nostyle].size.height + 5;
    return lastObjectY;
}

/***************************
 
 其他
 
 ***************************/
-(CGRect)calculateSizeWithFont:(NSInteger)Font Width:(NSInteger)Width Height:(NSInteger)Height Text:(NSString *)Text
{
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:Font]};
    CGRect size = [Text boundingRectWithSize:CGSizeMake(Width, Height)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil];
    return size;
}

@end
