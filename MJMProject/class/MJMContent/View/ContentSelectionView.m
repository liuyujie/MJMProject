//
//  ContentSelectionView.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionView.h"
#import "SelectionDetailsData.h"
#import "SelectionLabel.h"

@implementation ContentSelectionView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self makeContentselectionwithframe:frame];
    }
    return self;
}
/***************************
 
 view的主体
 
 ***************************/
-(void)makeContentselectionwithframe:(CGRect)frame
{
    self.backgroundColor = tabbar_hudgray;
    UIScrollView *selec_scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, 30)];
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *titlearray = [data makeSelectionData];
    
    NSInteger typeNum = titlearray.count;
    CGFloat selec_mainbtnWidth = 95;
    for (int i = 0; i < typeNum; i++)
    {
        NSMutableDictionary *selection_data = titlearray[i];
        NSString *selection_title = [selection_data objectForKey:@"title_simple"];
        NSString *first_data = [selection_data objectForKey:@"first_data"];
        UIView *selec_view = [self makeContentselectionbuttonWithtitle:selection_title firstdata:first_data index:i btnWidth:selec_mainbtnWidth];
        [self addSubview:selec_view];
        [selec_scrollview addSubview:selec_view];
    }
    selec_scrollview.showsHorizontalScrollIndicator = NO;
    selec_scrollview.contentSize = CGSizeMake(typeNum*selec_mainbtnWidth+content_selectionbutton_width, 30);
    [self addSubview:selec_scrollview];
}

/***************************
 
selectionView 的主标题和副标题
 
 ***************************/

-(UIView *)makeContentselectionbuttonWithtitle:(NSString *)title firstdata:(NSString *)firstdata index:(NSInteger)index btnWidth:(CGFloat)btnWidth
{
    UIView *selec_button = [[UIView alloc] initWithFrame:CGRectMake(btnWidth*index, 0, btnWidth, contentSelectionHeight)];
    SelectionLabel *label = [[SelectionLabel alloc] init];
    NSString *label_title = [title stringByAppendingFormat:@" >"];
    CGFloat labelWidth = [self calculateSizeWithFont:12 Width:MAXFLOAT Height:MAXFLOAT Text:label_title].size.width;
    label.text = label_title;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(10, 0, labelWidth, contentSelectionHeight);
    [selec_button addSubview:label];
    
    CGFloat sublabelX = CGRectGetMaxX(label.frame)+5;
    SelectionLabel *sublabel = [[SelectionLabel alloc] initWithFrame:CGRectMake(sublabelX-5, 0.8,btnWidth-sublabelX, contentSelectionHeight)];
    sublabel.font = [UIFont systemFontOfSize:11];
    sublabel.text = firstdata;
    sublabel.tag = index;
    sublabel.textColor = content_color;
    sublabel.textAlignment = NSTextAlignmentCenter;
    [[NSNotificationCenter defaultCenter] addObserver:sublabel
                                             selector:@selector(selectionClicked:)
                                                 name:@"selection_button_click"
                                               object:nil];
    [selec_button addSubview:sublabel];
    return selec_button;
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
