//
//  ContentMoreCellFrame.m
//  MJMProject
//
//  Created by bassamyan on 15/1/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentMoreCellFrame.h"
#import "UIView+MJM.h"


@implementation ContentMoreCellFrame

-(NSInteger)calculateCellFrameWithdramainfoarray:(NSMutableDictionary *)dramainfo_array
{
    NSArray *info_list = [dramainfo_array objectForKey:@"info_list"];
    
    
    CGFloat head_image_height = 110*(MJMWIDTH/320)-20;
    CGFloat positionX = 152.5*(MJMWIDTH/320)+35;
    CGFloat label_width = MJMWIDTH-positionX-5;
    CGFloat lastObjectY = 20;
    
    for (int i = 1; i < info_list.count; i++) {
        NSString *property_key = info_list[i];
        NSMutableDictionary *dic = [dramainfo_array objectForKey:property_key];
        lastObjectY = [self makeMJMDetailesWithproperty:[dic objectForKey:@"property"]
                                                   data:[dic objectForKey:@"value"]
                                                  datas:[dic objectForKey:@"values"]
                                            lastObjectY:lastObjectY
                                             labelWidth:label_width
                                           propertyfont:12
                                               bodyfont:11
                                   distanceBetweenlabel:2];
    }
    
    NSInteger cell_height = head_image_height+40;
    if (cell_height < lastObjectY+20 ) {
        cell_height = lastObjectY+20;
    }
    
    return cell_height+10;
}


-(CGFloat)makeMJMDetailesWithproperty:(NSString *)property
                                   data:(NSString *)data
                                  datas:(NSArray *)datas
                            lastObjectY:(CGFloat)lastObjectY
                             labelWidth:(CGFloat)labelWidth
                           propertyfont:(NSInteger)propertyfont
                               bodyfont:(NSInteger)bodyfont
                   distanceBetweenlabel:(CGFloat)distanceBetweenlabel

{
    

    NSString *value_nostyle = @"";
    NSString *text_output;
    
    //可点击文字
    if (data == nil && datas != nil) {
        for (int i=0; i<datas.count; i++) {
            text_output   = [NSString stringWithFormat:@"%@ / ",datas[i]];
            if (i == datas.count - 1) {
                text_output = datas[i];
            }
            value_nostyle = [value_nostyle stringByAppendingString:text_output];
        }
    }
    //不可点击文字
    else if(data != nil && datas == nil)
    {
        value_nostyle = [NSString stringWithFormat:@"%@ : %@",property,data];
    }
    
    CGRect property_height = [self calculateSizeWithFont:propertyfont Width:labelWidth Height:MAXFLOAT Text:[NSString stringWithFormat:@"%@ :  ",property]];
    CGRect values_rect = [self calculateSizeWithFont:bodyfont Width:labelWidth Height:MAXFLOAT Text:value_nostyle];
    
    CGFloat label_height = MAX(property_height.size.height, values_rect.size.height);
    
    lastObjectY += label_height + distanceBetweenlabel;
    
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
