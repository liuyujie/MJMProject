//
//  ContentSelection.m
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelection.h"
#import "ContentSelectionButton.h"
#import "UIImage+MJM.h"

@implementation ContentSelection


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self makeContentselectionwithframe:frame];
    }
    return self;
}
-(void)makeContentselectionwithframe:(CGRect)frame
{
//类型（科幻） 上映时间（2011） 地区（美国） //确定按钮 30 * 30
    UIView *content_mainV = [[UIView alloc] initWithFrame:frame];
    content_mainV.backgroundColor = tabbar_hudgray;
    CGFloat buttonWidth = (MJMWIDTH - content_selectionbutton_width) / 3;
    NSArray *titlearray = @[@"类型/科幻",@"热度/点击最多",@"时间/2015"];
    NSInteger typeNum = titlearray.count;
    for (int i = 0; i < typeNum; i++)
    {
        [self makeContentselectionbuttonWithtitle:titlearray[i] index:i buttonWidth:buttonWidth fatherView:content_mainV];
    }
    [self addSubview:content_mainV];
}


-(void)makeContentselectionbuttonWithtitle:(NSString *)title index:(NSInteger)index buttonWidth:(CGFloat)width fatherView:(UIView *)fatherView
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(index * width, 0, width, contentSelectionHeight)];
    [button setTitle:title forState:0];
    [button setBackgroundColor:tabbar_hudgray];
    [button setTitleColor:tabbar_buttongray forState:0];
    [button.titleLabel setFont:tabbar_selection_font];
    [button setTag:index];
    [fatherView addSubview:button];
}

-(void)selectionbuttonClickedWithButton:(ContentSelectionButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(selectionbuttonDidClicked)]) {
        [self.delegate selectionbuttonDidClicked];
    }
}
@end
