//
//  ContentMoreCell.m
//  MJMProject
//
//  Created by bassamyan on 15/1/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentMoreCell.h"
#import "UIImage+MJM.h"
#import "UILabel+MJM.h"
#import "UIView+MJM.h"
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"

@implementation ContentMoreCell



- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 5;
    frame.origin.y += 5;
    [super setFrame:frame];
}
/***************************
 
 根据controller获得的单个美剧的
 数据 计算相关的view
 
 ***************************/

-(void)makeContentMoreCellWithDramainfoarray:(NSMutableDictionary *)dramainfo_Array
{
    NSArray *info_list = [dramainfo_Array objectForKey:@"info_list"];
    
    
    CGFloat head_image_width = 152.5*(MJMWIDTH/320);
    CGFloat head_image_height = 110*(MJMWIDTH/320)-20;
    
    UIImageView *head_image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, head_image_width, head_image_height)];
    head_image.image = [UIImage resizedImageWithName:[dramainfo_Array objectForKey:info_list[0]]];
    [self addSubview:head_image];
    
    CGFloat positionX = CGRectGetMaxX(head_image.frame)+10;
    CGFloat lastObjectY = head_image.frame.origin.y;
    
    for (int i = 1; i < info_list.count; i++) {
        NSMutableDictionary *dic = [dramainfo_Array objectForKey:info_list[i]];
        lastObjectY = [self makeMJMDetailesWithfatherview:self
                                                  property:[dic objectForKey:@"property"]
                                                      data:[dic objectForKey:@"value"]
                                                     datas:[dic objectForKey:@"values"]
                                               lastObjectY:lastObjectY
                                                 positionX:positionX
                                                labelWidth:MJMWIDTH-positionX-10
                                             propertyfont:12
                                            propertycolor:[UIColor grayColor]
                                                 bodyfont:11
                                                bodyColor:gray_value
                                                linkColor:link_blue
                                     distanceBetweenlabel:2];
    }
    
    
}


-(CGFloat)makeMJMDetailesWithfatherview:(UIView *)fatherview
                               property:(NSString *)property
                                   data:(NSString *)data
                                  datas:(NSArray *)datas
                            lastObjectY:(CGFloat)lastObjectY
                              positionX:(CGFloat)positionX
                             labelWidth:(CGFloat)labelWidth
                           propertyfont:(NSInteger)propertyfont
                          propertycolor:(UIColor *)propertycolor
                               bodyfont:(NSInteger)bodyfont
                              bodyColor:(UIColor *)bodyColor
                              linkColor:(UIColor *)linkColor
                   distanceBetweenlabel:(CGFloat)distanceBetweenlabel

{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < datas.count; i++) {
        NSString *style = [NSString stringWithFormat:@"linkstyle%d",i+1];
        [dic setObject:
         [WPAttributedStyleAction styledActionWithAction:^{
#warning 添加函数体 点击事件
            NSLog(@"%@",datas[i]);
        }]forKey:style];
    }
    [dic setObject:@[[UIFont systemFontOfSize:bodyfont],linkColor] forKey:@"link"];
    [dic setObject:@[[UIFont systemFontOfSize:propertyfont],propertycolor] forKey:@"property"];
    [dic setObject:@[[UIFont systemFontOfSize:bodyfont],bodyColor] forKey:@"body"];

    
    NSString *value_withstyle;
    NSString *value_nostyle;
    NSString *text_noslash;
    NSString *text_withslash;
    NSString *text_output;
    
    //可点击文字
    if (data == nil && datas != nil) {
        value_withstyle    = [NSString stringWithFormat:@"<property>%@</property> : ",property];
        value_nostyle      = [NSString stringWithFormat:@"%@ : ",property];
        for (int i=0; i<datas.count; i++) {
            text_output   = [NSString stringWithFormat:@"%@ / ",datas[i]];
            text_noslash   = [NSString stringWithFormat:@"<linkstyle%d>%@</linkstyle%d>",i+1,datas[i],i+1];
            text_withslash = [NSString stringWithFormat:@"%@ / ",text_noslash];
            if (i == datas.count - 1) {
                text_output = datas[i];
                text_withslash = text_noslash;
            }
            value_nostyle = [value_nostyle stringByAppendingString:text_output];
            value_withstyle = [value_withstyle stringByAppendingString:text_withslash];
        }
    }
    //不可点击文字
    else if(data != nil && datas == nil)
    {
        value_nostyle = [NSString stringWithFormat:@"%@ : %@",property,data];
        value_withstyle = [NSString stringWithFormat:@"<property>%@ : </property>%@",property,data];
    }
    
    
    CGRect text_size = [self calculateSizeWithFont:bodyfont Width:labelWidth Height:MAXFLOAT Text:value_nostyle];
    
    
    
    WPHotspotLabel *label = [[WPHotspotLabel alloc] init];
    label.numberOfLines = 0;
    label.frame = CGRectMake(positionX, lastObjectY, text_size.size.width+5,text_size.size.height+3);
    label.attributedText = [value_withstyle attributedStringWithStyleBook:dic];
    [fatherview addSubview:label];
    
    lastObjectY += label.frame.size.height + distanceBetweenlabel;
    return lastObjectY;
}

@end
