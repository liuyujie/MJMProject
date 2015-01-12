//
//  ContentSelectionDetails.m
//  MJMProject
//
//  Created by ; on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionDetails.h"
#import "SelectionDetailsData.h"
#import "UIView+MJM.h"
#import "UIButton+MJM.h"
#import "UILabel+MJM.h"

@interface ContentSelectionDetails()
@property (nonatomic,strong) NSMutableArray *selbuttonArray;
@property (nonatomic,strong) NSMutableArray *selbutton_nameArray;
@end

@implementation ContentSelectionDetails

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self makeDetailsviewWithframe:(CGRect)frame];
    }
    return self;
}

-(NSMutableArray *)selbuttonArray
{
    if (_selbuttonArray == nil) {
        _selbuttonArray = [NSMutableArray array];
    }
    return _selbuttonArray;
}

-(NSMutableArray *)selbutton_nameArray
{
    if (_selbutton_nameArray == nil) {
        _selbutton_nameArray = [NSMutableArray array];
    }
    return _selbutton_nameArray;
}
/***************************
 
 设置下拉界面
 包含: 顶部确定按钮
      内容部分主题和内容
 
 ***************************/
-(void)makeDetailsviewWithframe:(CGRect)frame;
{
    CGFloat max_y = 0;
    
    UIScrollView *details_tableview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,30,MJMWIDTH,MJMHEIGHT-30)];
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *data_array = [data makeSelectionDetailsData];
    
    for (int i=0; i<data_array.count; i++) {
        NSMutableDictionary *dictionary = data_array[i];
        NSArray *dic_data = [dictionary objectForKey:@"selection_valueArray"];
        NSString *dic_detailtitle = [dictionary objectForKey:@"selection_property_detailed"];
        
        max_y = [self makeDetailscontentWitharray:dic_data type:dic_detailtitle fatherview:details_tableview positionY:max_y index:i];
    }
    details_tableview.contentSize = CGSizeMake(MJMWIDTH, max_y+150);
    [self addSubview:details_tableview];
    //确认按钮
    [self makeConfirmbutton];
    
    //底部的阴影
    [self makefootshadowWithview:self];
}

/***************************
 
 设置scrollview顶部的确定按钮和文字
 
 ***************************/
-(void)makeConfirmbutton
{
    //提示文字
    UIView *confirm_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, 30)];
    
    NSString *confirm_text = @"选定条件后,点击”确定“以继续 >";
    CGFloat confirm_textW = [self calculateSizeWithText:confirm_text TextFont:9].size.width;
    CGFloat confirm_textX = MJMWIDTH-confirm_textW-60;
    
    UILabel *confirm_label = [[UILabel alloc] init];
    [confirm_label labelWithlabel:confirm_label
                            frame:CGRectMake(confirm_textX, 5, confirm_textW, 30)
                             font:9
                             text:confirm_text
                        textColor:nil
                       fatherView:confirm_view];

    //确定按钮
    UIButton *confirm_button = [[UIButton alloc]init];
    [confirm_button titleNolmalStateDetailsForButton:confirm_button
                                           Withframe:CGRectMake(CGRectGetMaxX(confirm_label.frame)+5, 5, 50, 20)
                                          fatherView:confirm_view
                                               Title:@"确定"
                                          titleColor:main_color
                                     backgroundColor:[UIColor whiteColor]
                                                font:11];
    [confirm_button layersforButton:confirm_button
                   WithCornerRadius:3
                        borderColor:main_color
                        borderWidth:0.5
                             ifMask:YES];
    [confirm_button addTarget:self
                       action:@selector(confirmbuttonClicked)
             forControlEvents:1 << 6];

    //分割线
    [self makeLinesWithFrame:CGRectMake(0, 29, MJMWIDTH, 1)
                   lineColor:line_gray
                  fatherView:confirm_view];

    [self addSubview:confirm_view];
}

-(void)confirmbuttonClicked
{
    if ([self.delegate respondsToSelector:@selector(confirmbuttonclickedwithselectArray:)]) {
        [self.delegate confirmbuttonclickedwithselectArray:_selbutton_nameArray];
    }
}

/***************************
 
 设置selection条件和各主题
 
 类型: 惊悚 动画 科技
 
 ***************************/
-(CGFloat)makeDetailscontentWitharray:(NSArray *)array type:(NSString *)type fatherview:(UIView *)fatherview positionY:(CGFloat)positionY index:(NSInteger)index
{
    UIView *details_view = [[UIView alloc] init];
    CGFloat distanceBetweenButton = 20;
    
    //属性（美剧类型）
    UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(distanceBetweenButton, 5, 100, 30)];
    title_label.text = type;
    title_label.font = [UIFont systemFontOfSize:13];
    [details_view addSubview:title_label];
    
    //分割线
    UIView *line_view = [self makeLinesWithFrame:CGRectMake(distanceBetweenButton, CGRectGetMaxY(title_label.frame), MJMWIDTH-distanceBetweenButton, 1)
                                       lineColor:line_gray
                                      fatherView:details_view];
    
    //主内容
    UIView *content_view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line_view.frame) + 5, MJMWIDTH, ((array.count-1)/4 +1)*30)];
    for (int i=0; i<array.count; i++) {
        CGFloat button_width = (MJMWIDTH - 5*distanceBetweenButton)/4;
        UIButton *content_single_button = [[UIButton alloc] init];
        [content_single_button titleNolmalStateDetailsForButton:content_single_button Withframe:CGRectMake((i%4+1)*distanceBetweenButton + (i%4)*button_width,(i/4)*30 + 5, button_width, 20)
                                                     fatherView:content_view
                                                          Title:array[i]
                                                     titleColor:font_gray
                                                backgroundColor:nil
                                                           font:11];
        
        [content_single_button layersforButton:content_single_button
                              WithCornerRadius:3
                                   borderColor:font_gray
                                   borderWidth:0.5
                                        ifMask:YES];
        content_single_button.tag = index;
        if (i == 0) {
            [content_single_button setBackgroundColor:main_color];
            [content_single_button setTitleColor:[UIColor whiteColor] forState:0];
            
            [self.selbuttonArray addObject:content_single_button];
            [self.selbutton_nameArray addObject:content_single_button.titleLabel.text];
        }
        [content_single_button addTarget:self
                                  action:@selector(detailscontentbuttonClicked:)
                        forControlEvents:1 << 6];
        
    }
    [details_view addSubview:content_view];
    details_view.frame = CGRectMake(0,positionY, MJMWIDTH, CGRectGetMaxY(content_view.frame));
    positionY += CGRectGetMaxY(content_view.frame);
    [fatherview addSubview:details_view];
    return positionY;
}

-(void)detailscontentbuttonClicked:(UIButton *)button
{
    [_selbuttonArray[button.tag] setBackgroundColor:[UIColor whiteColor]];
    [_selbuttonArray[button.tag] setTitleColor:font_gray forState:0];
    _selbuttonArray[button.tag] = button;
    
    [button setBackgroundColor:main_color];
    [button setTitleColor:[UIColor whiteColor] forState:0];
    
    _selbutton_nameArray[button.tag] = button.titleLabel.text;
    
    NSString *tagString = [NSString stringWithFormat:@"%d",(int)button.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selection_button_click"
                                                        object:button
                                                      userInfo:@{@"select_name":button.titleLabel.text,
                                                                 @"select_index":tagString}];
}

/***************************
 
 设置view底部的阴影
 
 ***************************/
-(void)makefootshadowWithview:(UIView *)view
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.opacity = 0.6;
    gradient.frame = CGRectMake(0, view.frame.size.height-30, view.frame.size.width, 30);
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor clearColor].CGColor,
                       (id)[UIColor grayColor].CGColor,nil];
    [view.layer insertSublayer:gradient atIndex:0];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
