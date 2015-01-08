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
-(void)makeContentselectionwithframe:(CGRect)frame
{
    self.backgroundColor = tabbar_hudgray;
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *titlearray = [data makeSelectionData];
    
    NSInteger typeNum = titlearray.count;
    for (int i = 0; i < typeNum; i++)
    {
        NSMutableDictionary *selection_data = titlearray[i];
        NSString *selection_title = [selection_data objectForKey:@"selection_title"];
        NSString *first_data = [selection_data objectForKey:@"first_data"];
        UIView *selec_view = [[UIView alloc] initWithFrame:CGRectMake(content_selec_buttons_width*i, 0, content_selec_buttons_width, contentSelectionHeight)];
        [self makeContentselectionbuttonWithtitle:selection_title firstdata:first_data index:i fatherView:selec_view];
        [self addSubview:selec_view];
    }
}


-(void)makeContentselectionbuttonWithtitle:(NSString *)title firstdata:(NSString *)firstdata index:(NSInteger)index fatherView:(UIView *)fatherView
{
    SelectionLabel *label = [[SelectionLabel alloc] init];
    NSString *label_title = [title stringByAppendingFormat:@" >"];
    label.text = label_title;
    label.font = [UIFont systemFontOfSize:12];
    label.tag = index;
    label.textAlignment = NSTextAlignmentCenter;
    CGFloat labelWidth = [self calculateSizeWithFont:12 Width:MAXFLOAT Height:MAXFLOAT Text:label_title].size.width;
    label.frame = CGRectMake(10, 0, labelWidth, 30);
    [fatherView addSubview:label];
    
    SelectionLabel *sublabel = [[SelectionLabel alloc] initWithFrame:CGRectMake(labelWidth+label.frame.origin.x, 0.5,content_selec_buttons_width-CGRectGetMaxX(label.frame), 30)];
    sublabel.font = [UIFont systemFontOfSize:11];
    sublabel.text = firstdata;
    sublabel.tag = index;
    sublabel.textColor = content_color;
    sublabel.textAlignment = NSTextAlignmentCenter;
    [[NSNotificationCenter defaultCenter] addObserver:sublabel
                                             selector:@selector(selectionClicked:)
                                                 name:@"selection_button_click"
                                               object:nil];
    [fatherView addSubview:sublabel];
}

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
