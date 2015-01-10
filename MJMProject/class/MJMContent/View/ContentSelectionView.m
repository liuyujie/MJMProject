//
//  ContentSelectionView.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionView.h"
#import "SelectionDetailsData.h"
#import "UIView+MJM.h"
#import "UILabel+MJM.h"

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
    self.backgroundColor = main_color;
    UIScrollView *selec_scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *titlearray = [data makeSelectionData];
    NSInteger typeNum = titlearray.count;
    for (int i = 0; i < typeNum; i++)
    {
        NSMutableDictionary *dic = titlearray[i];
        [selec_scrollview addSubview:[self makeContentselectionbuttonWithtitle:[dic objectForKey:@"title_simple"]
                                                                     firstdata:[dic objectForKey:@"first_data"]
                                                                         index:i
                                                                      btnWidth:95]];
    }
    selec_scrollview.showsHorizontalScrollIndicator = NO;
    selec_scrollview.contentSize = CGSizeMake(typeNum*95+content_selectionbutton_width, contentSelectionHeight);
    
    [self addSubview:selec_scrollview];
}

/***************************
 
selectionView 的主标题和副标题
 
 ***************************/

-(UIView *)makeContentselectionbuttonWithtitle:(NSString *)title firstdata:(NSString *)firstdata index:(NSInteger)index btnWidth:(CGFloat)btnWidth
{
    UIView *selec_button = [[UIView alloc] initWithFrame:CGRectMake(btnWidth*index, 0, btnWidth, contentSelectionHeight)];
    UILabel *label = [[UILabel alloc] init];
    NSString *title_after = [NSString stringWithFormat:@"%@ >",title];
    [label labelWithlabel:label
                    frame:CGRectMake(10, 0, [self calculateSizeWithText:title_after TextFont:12].size.width, contentSelectionHeight)
                     font:12
                     text:title_after
                textColor:[UIColor whiteColor]
               fatherView:selec_button];
    
    CGFloat sublabelX = CGRectGetMaxX(label.frame);
    UILabel *sublabel = [[UILabel alloc] initWithFrame:CGRectMake(sublabelX,0.6,btnWidth-sublabelX,contentSelectionHeight)];
    sublabel.font = [UIFont systemFontOfSize:11];
    sublabel.text = firstdata;
    sublabel.tag = index;
    sublabel.textColor = [UIColor whiteColor];
    sublabel.textAlignment = NSTextAlignmentCenter;
    [[NSNotificationCenter defaultCenter] addObserver:sublabel
                                             selector:@selector(selectionClicked:)
                                                 name:@"selection_button_click"
                                               object:nil];
    [selec_button addSubview:sublabel];
    
    return selec_button;
}

@end
