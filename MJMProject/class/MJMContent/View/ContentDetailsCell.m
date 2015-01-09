//
//  ContentDetailsCell.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentDetailsCell.h"
#import "NSString+WPAttributedMarkup.h"
#import "WPAttributedStyleAction.h"
#import "WPHotspotLabel.h"

@interface ContentDetailsCell()
{
    CGFloat lastObjectY;
    CGFloat positionX;
}
@end

@implementation ContentDetailsCell

-(void)makeContentdetailscellWithDic:(NSMutableDictionary *)dic
{
    UIView *cell_total = [[UIView alloc] init];
    
    /***************
     
     设置dic中的数据
     
     ***************/
    
    
    NSMutableArray *data_Array = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *directors_dic = [dic objectForKey:@"head_directors"];
    [data_Array addObject:directors_dic];
    NSMutableDictionary *scriptwriter_dic = [dic objectForKey:@"head_scriptwriter"];
    [data_Array addObject:scriptwriter_dic];
    NSMutableDictionary *actor_dic = [dic objectForKey:@"head_actor"];
    [data_Array addObject:actor_dic];
    NSMutableDictionary *type = [dic objectForKey:@"head_type"];
    [data_Array addObject:type];
    NSMutableDictionary *publish_time = [dic objectForKey:@"head_publishtime"];
    [data_Array addObject:publish_time];
    NSMutableDictionary *now_episode = [dic objectForKey:@"head_nowepisode"];
    [data_Array addObject:now_episode];
    NSMutableDictionary *state = [dic objectForKey:@"head_state"];
    [data_Array addObject:state];
    
    
    
    
    /***************
     
     设置cell的头部
     
     ***************/
    UIView *cell_head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, 200)];
    
    
    //美剧标题、英文标题
    CGFloat head_title_CHN_Width = [self calculateSizeWithFont:font_contentmaintitle
                                                         Width:MAXFLOAT
                                                        Height:MAXFLOAT
                                                          Text:[dic objectForKey:@"head_title_CHN"]].size.width;
    
    UILabel *head_title = [self celllabelWithframe:CGRectMake(20, 10, head_title_CHN_Width, 20)
                                              font:font_contentmaintitle
                                              text:[dic objectForKey:@"head_title_CHN"]];
    head_title.font = [UIFont boldSystemFontOfSize:18];
    [cell_head addSubview:head_title];
    
    CGFloat head_title_ENG_Width = [self calculateSizeWithFont:font_contentsubtitle
                                                         Width:MAXFLOAT
                                                        Height:MAXFLOAT
                                                          Text:[dic objectForKey:@"head_title_ENG"]].size.width;
    
    UILabel *head_subtitle = [self celllabelWithframe:CGRectMake(CGRectGetMaxX(head_title.frame)+5, head_title.frame.origin.y+2, head_title_ENG_Width, 20)
                                                 font:font_contentsubtitle
                                                 text:[dic objectForKey:@"head_title_ENG"]];
    [cell_head addSubview:head_subtitle];
    
    //美剧详细介绍图片
    UIImageView *head_mainview = [[UIImageView alloc] initWithFrame:CGRectMake(head_title.frame.origin.x, CGRectGetMaxY(head_title.frame)+10, 100, 150)];
    head_mainview.backgroundColor = [UIColor yellowColor];
    [cell_head addSubview:head_mainview];
    
    
    //美剧相关数据
    lastObjectY = head_mainview.frame.origin.y;
    positionX = CGRectGetMaxX(head_mainview.frame);
    for (int i = 0; i < data_Array.count; i++) {
        lastObjectY = [self makeMJMDetailesWithfatherview:cell_head
                                                 property:[data_Array[i] objectForKey:@"head_name"]
                                                     data:[data_Array[i] objectForKey:@"head_data"]
                                                    datas:[data_Array[i] objectForKey:@"head_datas"]];
    }

    [cell_total addSubview:cell_head];
    
    /***************
     
     设置dic的主体内容
     
     ***************/
    UIView *cell_body = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_head.frame), MJMWIDTH, 200)];
    cell_body.backgroundColor = [UIColor greenColor];
    [cell_total addSubview:cell_body];
    
    
    /***************
     
     设置cell的尾部
     
     ***************/
    UIView *cell_foot = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_body.frame), MJMWIDTH, 30)];
    cell_foot.backgroundColor = [UIColor blueColor];
    [cell_total addSubview:cell_foot];
    
    cell_total.frame = CGRectMake(0, 0, MJMWIDTH, CGRectGetMaxY(cell_foot.frame));
    [self.contentView addSubview:cell_total];
}


/***************************
 
 设置label的格式和点击事件
 
 ***************************/

-(CGFloat)makeMJMDetailesWithfatherview:(UIView *)fatherview
                               property:(NSString *)property
                                   data:(NSString *)data
                                  datas:(NSArray *)datas

{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < datas.count; i++) {
        NSString *style = [NSString stringWithFormat:@"linkstyle%d",i+1];
        [dic setObject:
         [WPAttributedStyleAction styledActionWithAction:^{
            NSLog(@"%@",datas[i]);
        }]forKey:style];
    }
    [dic setObject:link_blue forKey:@"link"];
    [dic setObject:gray_title forKey:@"fontcolor"];
    [dic setObject:[UIFont systemFontOfSize:font_cellmain] forKey:@"body"];
    
    WPHotspotLabel *label = [[WPHotspotLabel alloc] init];
    label.numberOfLines = 0;
    
    NSString *property_withstyle;
    NSString *property_nostyle;
    if (data == nil && datas != nil) {
        property_withstyle = [NSString stringWithFormat:@"<fontcolor>%@</fontcolor> : ",property];
        property_nostyle = [NSString stringWithFormat:@"%@ : ",property];
        for (int i=0; i<datas.count; i++) {
            NSString *property_one = [NSString stringWithFormat:@"%@ / ",datas[i]];
            if (i == datas.count-1) {
                property_one = [NSString stringWithFormat:@"%@",datas[i]];
            }
            property_nostyle = [property_nostyle stringByAppendingString:property_one];
            NSString *styleBegin = [NSString stringWithFormat:@"<linkstyle%d>",i+1];
            NSString *styleEnd = [NSString stringWithFormat:@"</linkstyle%d>",i+1];
            property_withstyle = [property_withstyle stringByAppendingString:[NSString stringWithFormat:@"%@%@%@",styleBegin,property_one,styleEnd]];
        }
    }
    else if(data != nil && datas == nil)
    {
        property_nostyle = [NSString stringWithFormat:@"%@ : %@",property,data];
        property_withstyle = [NSString stringWithFormat:@"<fontcolor>%@ : </fontcolor>%@",property,data];
    }
    CGRect Rect = [self calculateSizeWithFont:font_cellmain Width:MJMWIDTH-(positionX+25) Height:MAXFLOAT Text:property_nostyle];
    label.frame = CGRectMake(positionX+10, lastObjectY, Rect.size.width, Rect.size.height);
    label.attributedText = [property_withstyle attributedStringWithStyleBook:dic];
    [fatherview addSubview:label];
    
    lastObjectY += label.frame.size.height+3;
    return lastObjectY;

}

/***************************
 
 label 集成
 
 ***************************/

-(UILabel *)celllabelWithframe:(CGRect)frame font:(NSInteger)font text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = gray_title;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
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
