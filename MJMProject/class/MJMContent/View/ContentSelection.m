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
#import "ContentSelectionDetails.h"
#import "SelectionDetailsData.h"

@interface ContentSelection()
@end

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
    
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *titlearray = [data makeSelectionData];
    
    NSInteger typeNum = titlearray.count;
    for (int i = 0; i < typeNum; i++)
    {
        UIButton *button = [self makeContentselectionbuttonWithtitle:titlearray[i] index:i buttonWidth:buttonWidth];
        [[NSNotificationCenter defaultCenter] addObserver:button
                                                 selector:@selector(selectionClicked:)
                                                     name:@"selection_button_click"
                                                   object:nil];
        [content_mainV addSubview:button];
    }
    [self addSubview:content_mainV];
}


-(UIButton *)makeContentselectionbuttonWithtitle:(NSString *)title index:(NSInteger)index buttonWidth:(CGFloat)width
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(index * width, 0, width, contentSelectionHeight)];
    [button setTitle:title forState:0];
    [button setBackgroundColor:tabbar_hudgray];
    [button setTitleColor:tabbar_buttongray forState:0];
    [button.titleLabel setFont:tabbar_selection_font];
    [button setTag:index];
    return button;
}


@end
