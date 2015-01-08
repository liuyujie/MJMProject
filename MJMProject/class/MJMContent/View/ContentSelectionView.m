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
    self.frame = frame;
    self.backgroundColor = tabbar_hudgray;
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *titlearray = [data makeSelectionData];
    
    NSInteger typeNum = titlearray.count;
    for (int i = 0; i < typeNum; i++)
    {
        UIView *selec_view = [[UIView alloc] initWithFrame:CGRectMake(content_selec_buttons_width*i, 0, content_selec_buttons_width, contentSelectionHeight)];
        SelectionLabel *label = [self makeContentselectionbuttonWithtitle:titlearray[i] index:i];

        [selec_view addSubview:label];
        [self addSubview:selec_view];
    }
}


-(SelectionLabel *)makeContentselectionbuttonWithtitle:(NSString *)title index:(NSInteger)index
{
    SelectionLabel *label = [[SelectionLabel alloc] initWithFrame:CGRectMake(10, 0, content_selec_buttons_width-20, contentSelectionHeight)];
    [[NSNotificationCenter defaultCenter] addObserver:label
                                             selector:@selector(selectionClicked:)
                                                 name:@"selection_button_click"
                                               object:nil];
    label.text = title;
    label.font = tabbar_selection_font;
    label.tag = index;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
