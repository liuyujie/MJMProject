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
#import "CellData.h"
#import "UIView+MJM.h"
#import "UILabel+MJM.h"
#import "UIButton+MJM.h"
#import "UIImage+MJM.h"

@interface ContentDetailsCell()
@property (nonatomic,strong) NSMutableArray *evaluate_btnlist;
@end

@implementation ContentDetailsCell

-(NSMutableArray *)evaluate_btnlist
{
    if (_evaluate_btnlist == nil) {
        _evaluate_btnlist = [NSMutableArray array];
    }
    return _evaluate_btnlist;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    frame.origin.y += 10;
    [super setFrame:frame];
}

-(void)makeContentdetailscellWithDic:(NSMutableDictionary *)dic
{
    UIView *cell_total = [[UIView alloc] init];
    
    /***************
     
     根据list中的key 获取dic中的数据
     
     ***************/
    
    NSArray *list_array = @[@"head_directors",@"head_scriptwriter",@"head_actor",@"head_type",@"head_publishtime",@"head_nowepisode",@"head_state"];
    
    NSMutableArray *data_Array = [[NSMutableArray alloc] init];
    for (int i = 0; i < list_array.count; i++) {
        NSMutableDictionary *dics = [dic objectForKey:list_array[i]];
        [data_Array addObject:dics];
    }

    /***************
     
     设置cell的头部
     
     ***************/
    
    UIView *cell_head = [[UIView alloc] init];
    //美剧标题、英文标题
    NSString *head_title_CHN = [dic objectForKey:@"head_title_CHN"];
    UILabel *head_title = [self celllabelWithframe:CGRectMake(15, 10, [self calculateSizeWithText:head_title_CHN TextFont:18].size.width, 20)
                                              font:18
                                              text:head_title_CHN];
    head_title.font = [UIFont boldSystemFontOfSize:18];
    [cell_head addSubview:head_title];
    
    NSString *head_title_ENG = [dic objectForKey:@"head_title_ENG"];
    UILabel *head_subtitle = [self celllabelWithframe:CGRectMake(CGRectGetMaxX(head_title.frame)+5, head_title.frame.origin.y+2, [self calculateSizeWithText:head_title_ENG TextFont:15].size.width, 20)
                                                 font:15
                                                 text:head_title_ENG];
    [cell_head addSubview:head_subtitle];
    
    //评分
    UILabel *head_grade = [[UILabel alloc] init];
    [head_grade labelWithlabel:head_grade
                         frame:CGRectMake(MJMWIDTH-50, 0, 40, 40)
                          font:20
                          text:@"9.7"
                     textColor:main_color
                    fatherView:cell_head];
    
    //美剧详细介绍图片
    UIImageView *head_mainview = [[UIImageView alloc] initWithFrame:CGRectMake(head_title.frame.origin.x, CGRectGetMaxY(head_title.frame)+10, 100, 150)];
    head_mainview.backgroundColor = [UIColor yellowColor];
    [cell_head addSubview:head_mainview];
    
    
    //美剧属性和属性相关数据
    CGFloat lastObjectY = head_mainview.frame.origin.y;
    CGFloat positionX = CGRectGetMaxX(head_mainview.frame);
    for (int i = 0; i < data_Array.count; i++) {
        NSMutableDictionary *dic = data_Array[i];
        lastObjectY = [self makeMJMDetailesWithfatherview:cell_head
                                                 property:[dic objectForKey:@"head_name"]
                                                     data:[dic objectForKey:@"head_data"]
                                                    datas:[dic objectForKey:@"head_datas"]
                                              lastObjectY:lastObjectY
                                                positionX:positionX];
    }
    
    CGFloat head_Height = CGRectGetMaxY(head_mainview.frame);
    if (CGRectGetMaxY(head_mainview.frame) < lastObjectY) {
        head_Height = lastObjectY;
    }
    cell_head.frame = CGRectMake(0, 0, MJMWIDTH, head_Height+10);
    [cell_total addSubview:cell_head];
    
    /***************
     
     设置dic的主体内容
     
     ***************/
    UIView *cell_body = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_head.frame), MJMWIDTH, 200)];
    
    //分割线
    UIView *lineview = [self makeLinesWithFrame:CGRectMake(15, 0, MJMWIDTH, 1) lineColor:line_gray fatherView:cell_body];
    
    //评价
    UIView *evalueteView = [self makeEvaluationWithfatherView:cell_body frame:CGRectMake(15, CGRectGetMaxY(lineview.frame)+5, MJMWIDTH-40, 20)];
    
    //评论
      //提示文字
    UILabel *text_hit = [[UILabel alloc] init];
    NSString *hit_text = [NSString stringWithFormat:@"关于%@的评论...",head_title_CHN];
    [text_hit labelWithlabel:text_hit
                       frame:CGRectMake(15, CGRectGetMaxY(evalueteView.frame)+5, [self calculateSizeWithText:hit_text TextFont:12].size.width, 12)
                        font:12
                        text:hit_text
                   textColor:gray_title
                  fatherView:cell_body];
    text_hit.font = [UIFont boldSystemFontOfSize:12];
      //具体评论
//    [self makeCommentsWithfatherView:cell_body frame:CGRectMake(0, CGRectGetMaxY(text_hit.frame)+5, MJMWIDTH, 100) head_title:head_title_CHN];
    UIView *commentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(text_hit.frame)+5, MJMWIDTH, 100)];
    commentView.backgroundColor = gray_comment;
    [cell_body addSubview:commentView];
    
    [cell_total addSubview:cell_body];
    
    
    /***************
     
     设置cell的尾部
     
     ***************/
    UIView *cell_foot = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_body.frame), MJMWIDTH, 0)];
    cell_foot.backgroundColor = [UIColor blueColor];
    [cell_total addSubview:cell_foot];
    
    cell_total.frame = CGRectMake(0, 0, MJMWIDTH, CGRectGetMaxY(cell_foot.frame));
    [self.contentView addSubview:cell_total];
}

/***************************
 
 评论
 
 ***************************/
//-(UIView *)makeCommentsWithfatherView:(UIView *)fatherView frame:(CGRect)frame head_title:(NSString *)head_title
//{
//    UIView *commentsView = [[UIView alloc] initWithFrame:frame];
//    
//    [fatherView addSubview:commentsView];
//}


/***************************
 
 评价
 
 ***************************/
-(UIView *)makeEvaluationWithfatherView:(UIView *)fatherView frame:(CGRect)frame
{
    UIView *evaluste_view = [[UIView alloc] initWithFrame:frame];
    //提示文字
    UILabel *text_hit = [[UILabel alloc] init];
    [text_hit labelWithlabel:text_hit
                       frame:CGRectMake(0, 1, 55, 12)
                        font:12
                        text:@"对它评价 : "
                   textColor:gray_title
                  fatherView:evaluste_view];
    text_hit.font = [UIFont boldSystemFontOfSize:12];
    
    for (int i=0; i<5; i++) {
        UIButton *star_button = [[UIButton alloc] initWithFrame:CGRectMake(60+i*18, 0, 14, 14)];
        star_button.tag = i;
        [star_button setBackgroundImage:[UIImage resizedImageWithName:@"star_mainColor.png"] forState:1 << 2];
        [star_button setBackgroundImage:[UIImage resizedImageWithName:@"star_noColor.png"] forState:0];
        [star_button setBackgroundImage:[UIImage resizedImageWithName:@"star_noColor.png"] forState:1 << 0];
        [star_button addTarget:self
                        action:@selector(starButtonClickWithButton:)
              forControlEvents:1 << 6];
        [self.evaluate_btnlist addObject:star_button];
        [evaluste_view addSubview:star_button];
    }
    [fatherView addSubview:evaluste_view];
    
    return evaluste_view;
}

-(void)starButtonClickWithButton:(UIButton *)button
{
    UIButton *star_btn = _evaluate_btnlist[button.tag];
    NSInteger btn_index = star_btn.tag;
    for (int i=0; i<5; i++) {
        UIButton *star_indexBtn = _evaluate_btnlist[i];
        if (i <= btn_index) {
            star_indexBtn.selected = YES;
        }
        else
        {
            star_indexBtn.selected = NO;
        }
    }
}



/***************************
 
 设置label的格式和点击事件
 
 ***************************/

-(CGFloat)makeMJMDetailesWithfatherview:(UIView *)fatherview
                               property:(NSString *)property
                                   data:(NSString *)data
                                  datas:(NSArray *)datas
                            lastObjectY:(CGFloat)lastObjectY
                              positionX:(CGFloat)positionX

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
    [dic setObject:link_blue forKey:@"link"];
    [dic setObject:gray_title forKey:@"property_color"];
    [dic setObject:[UIFont systemFontOfSize:font_Main] forKey:@"body"];
    
    WPHotspotLabel *label = [[WPHotspotLabel alloc] init];
    label.numberOfLines = 0;
    
    NSString *value_withstyle;
    NSString *value_nostyle;
    NSString *text_noslash;
    NSString *text_withslash;
    NSString *text_output;
    //可点击文字
    if (data == nil && datas != nil) {
        value_withstyle    = [NSString stringWithFormat:@"<property_color>%@</property_color> : ",property];
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
        value_withstyle = [NSString stringWithFormat:@"<property_color>%@ : </property_color>%@",property,data];
    }
    
    CGRect Rect = [self calculateSizeWithFont:font_Main Width:MJMWIDTH-(positionX+25) Height:MAXFLOAT Text:value_nostyle];
    label.frame = CGRectMake(positionX+10, lastObjectY, Rect.size.width, Rect.size.height);
    label.attributedText = [value_withstyle attributedStringWithStyleBook:dic];
    [fatherview addSubview:label];
    
    lastObjectY += label.frame.size.height+5;
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
@end
