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
    }
    return self;
}
/***************************
 
 view的主体
 
 ***************************/
-(void)setFirst_selection:(NSArray *)first_selection
{
    _first_selection = first_selection;
    [self makeContentselectionWithSelectionarray:first_selection];
}

-(void)makeContentselectionWithSelectionarray:(NSArray *)selection_Array
{
    self.backgroundColor = main_color;
    UIScrollView *selec_scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(52, 0, MJMWIDTH-60, contentSelectionHeight)];

    CGFloat btnwidth = 105;
    NSInteger typeNum = selection_Array.count;
    for (int i = 0; i < typeNum; i++)
    {
        NSMutableDictionary *dic = selection_Array[i];
        [selec_scrollview addSubview:[self makeContentselectionlabelWithProperty:[dic objectForKey:@"selection_property"]
                                                                     firstValue:[dic objectForKey:@"selection_valueArray"]
                                                                         index:i
                                                                      btnWidth:btnwidth]];
    }
    selec_scrollview.showsHorizontalScrollIndicator = NO;
    selec_scrollview.contentSize = CGSizeMake(typeNum*btnwidth+20, contentSelectionHeight);
    
    [self addSubview:selec_scrollview];
}

/***************************
 
selectionView 的主标题和副标题
 
 ***************************/

-(UIView *)makeContentselectionlabelWithProperty:(NSString *)Property firstValue:(NSString *)firstValue index:(NSInteger)index btnWidth:(CGFloat)btnWidth
{
    UIView *selec_button = [[UIView alloc] initWithFrame:CGRectMake(btnWidth*index, 0, btnWidth, contentSelectionHeight)];
    //标题
    UILabel *label = [[UILabel alloc] init];
    NSString *Property_change = [NSString stringWithFormat:@"%@ >",Property];
    [label labelWithlabel:label
                    frame:CGRectMake(0, 0, [self calculateSizeWithText:Property_change TextFont:12].size.width, contentSelectionHeight)
                     font:12
                     text:Property_change
                textColor:[UIColor whiteColor]
               fatherView:selec_button];
    
    CGFloat sublabelX = CGRectGetMaxX(label.frame);
    //选择的值
    UILabel *sublabel = [[UILabel alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:sublabel
                                             selector:@selector(selectionClicked:)
                                                 name:@"selection_button_click"
                                               object:nil];
    [sublabel labelWithlabel:sublabel
                       frame:CGRectMake(sublabelX,0.7,btnWidth-sublabelX,contentSelectionHeight)
                        font:11
                        text:firstValue
                   textColor:gold
                  fatherView:selec_button];
    sublabel.font = [UIFont boldSystemFontOfSize:11];
    sublabel.tag = index;
    sublabel.textAlignment = NSTextAlignmentCenter;
    
    return selec_button;
}

@end
