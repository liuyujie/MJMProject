//
//  ContentMainview.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentMainview.h"
#import "UIButton+MJM.h"
#import "MainviewButton.h"
#import "UIImage+MJM.h"
#import "UILabel+MJM.h"

@implementation ContentMainview

-(void)makeMaincontentWithDramaArray:(NSMutableArray *)DramaArray
{
    CGFloat positionY = 20;
    
    UIScrollView *Drama_view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    
    Drama_view.backgroundColor = scrollview_gray;
    for (int i=0; i<3; i++) {
        NSMutableDictionary *property_Array = DramaArray[i];
        
        positionY = [self makeSingleDramaviewWithfatherview:Drama_view
                                              view_property:[property_Array objectForKey:@"dramas_proerty"]
                                                 view_value:[property_Array objectForKey:@"dramas_value_Array"]
                                                  positionY:positionY];
    }
    Drama_view.contentSize = CGSizeMake(MJMWIDTH, positionY+49);
    [self addSubview:Drama_view];
}

/***************************
 
 drama的详细信息 点击事件
 
 ***************************/

-(void)dramaviewClickWithgesture:(UIGestureRecognizer *)gesture
{
    if ([self.delegate respondsToSelector:@selector(dramaviewdidClickWithdramaID:)]) {
        [self.delegate dramaviewdidClickWithdramaID:gesture.view.tag];
    }
}

/***************************
 
 设置单个drama的view
 
 ***************************/

-(CGFloat )makeSingleDramaviewWithfatherview:(UIView *)fatherview view_property:(NSString *)view_property view_value:(NSArray *)view_value positionY:(CGFloat)positionY
{
    UIView *drama_view = [[UIView alloc] init];
    
    MainviewButton *property = [[MainviewButton alloc] init];
    [property titleNolmalStateDetailsForButton:property
                                     Withframe:CGRectMake(5,0,MJMWIDTH-10, 30)
                                    fatherView:drama_view
                                         Title:view_property
                                    titleColor:main_color
                               backgroundColor:[UIColor clearColor]
                                          font:14];
    [property setImage:[UIImage imageNamed:@"content_moreArrow.png"] forState:0];
    [property addTarget:self
                 action:@selector(dramasMorebuttonClickWithbutton:)
       forControlEvents:1 << 6];
    
    //点击查看更多
    UILabel *dramas_more = [[UILabel alloc] init];
    [dramas_more labelWithlabel:dramas_more
                          frame:CGRectMake(MJMWIDTH-50, 0, 50, 30)
                           font:11
                           text:@"更多"
                      textColor:main_color
                     fatherView:drama_view];
    
    
    CGFloat dramaview_width = 152.5*(MJMWIDTH/320);
    CGFloat dramaview_height = 110*(MJMWIDTH/320);
    CGFloat lastView_height = 30;
    CGFloat drama_Num = view_value.count;
    for (int i = 0; i<drama_Num; i++) {
        if (i>5) {
            break;
        }
        CGFloat row = i/2;
        CGFloat column = i%2;
        
        NSMutableDictionary *dic = view_value[i];
        NSString *drama_pic = [dic objectForKey:@"drama_pic"];
        NSString *drama_name = [dic objectForKey:@"drama_name"];
        NSString *drama_mark = [dic objectForKey:@"drama_mark"];
        NSString *drama_keyID = [dic objectForKey:@"drama_keyID"];
        
        
        UIView *drama = [[UIView alloc] initWithFrame:CGRectMake((dramaview_width+5)*column, 5+CGRectGetMaxY(property.frame)+row*(10+dramaview_height), dramaview_width, dramaview_height)];
        drama.backgroundColor = [UIColor whiteColor];
        
        //图片
        UIImageView *drama_pic_view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, drama.frame.size.width, dramaview_height-20)];
        drama_pic_view.image = [UIImage resizedImageWithName:drama_pic];
        drama_pic_view.userInteractionEnabled = YES;
        drama_pic_view.tag= [drama_keyID intValue];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(dramaviewClickWithgesture:)];
        [drama_pic_view addGestureRecognizer:gesture];
        [drama addSubview:drama_pic_view];
        
        //名称
        UILabel *drama_name_view = [[UILabel alloc] init];
        [drama_name_view labelWithlabel:drama_name_view
                                  frame:CGRectMake(5, CGRectGetMaxY(drama_pic_view.frame), drama.frame.size.width, 20)
                                   font:11
                                   text:drama_name
                              textColor:font_gray
                             fatherView:drama];
        
        //评分
        UILabel *drama_mark_view = [[UILabel alloc] init];
        [drama_mark_view labelWithlabel:drama_mark_view
                                  frame:CGRectMake(drama.frame.size.width-28,drama_name_view.frame.origin.y, 25, 20)
                                   font:13
                                   text:drama_mark
                              textColor:[UIColor redColor]
                             fatherView:drama];
        drama_mark_view.textAlignment = NSTextAlignmentRight;
        
        [drama_view addSubview:drama];

        if (i == drama_Num-1 && drama_Num<7) {
            lastView_height = CGRectGetMaxY(drama.frame)+10;
        }
        else
        {
            lastView_height = (dramaview_height+10)*3 + 45;
        }
    }
    
    drama_view.frame = CGRectMake(5, positionY, MJMWIDTH-10, lastView_height);
    positionY += drama_view.frame.size.height+10;
    [fatherview addSubview:drama_view];
    
    return positionY;
    
}

/***************************
 
 更多按钮
 
 ***************************/

-(void)dramasMorebuttonClickWithbutton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(dramasMoreWithCondition:)]) {
        [self.delegate dramasMoreWithCondition:button.titleLabel.text];
    }
}


@end
