//
//  ContentSelectionDetails.m
//  MJMProject
//
//  Created by ; on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionDetails.h"
#import "SelectionDetailsData.h"

@interface ContentSelectionDetails()
{
    CGFloat max_y;
}
@end

@implementation ContentSelectionDetails

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeDetailsviewWithframe:(CGRect)frame];
        [self makeConfirmbuttonWithfatherview:[_details_tableview superview]];
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

-(void)makeDetailsviewWithframe:(CGRect)frame;
{
    max_y = 0;
    _details_tableview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,30,MJMWIDTH,0)];
    
    SelectionDetailsData *data = [[SelectionDetailsData alloc] init];
    NSMutableArray *data_array = [data makeSelectionDetailsData];
    
    for (int i=0; i<data_array.count; i++) {
        NSMutableDictionary *dictionary = data_array[i];
        NSArray *dic_data = [dictionary objectForKey:@"selection_data"];
        NSString *dic_detailtitle = [dictionary objectForKey:@"selection_detailtitle"];
        [self makeDetailscontentWitharray:dic_data type:dic_detailtitle fatherview:_details_tableview positionY:max_y index:i];
    }
    _details_tableview.contentSize = CGSizeMake(MJMWIDTH, max_y);
    
    
    [self addSubview:_details_tableview];
    
}

-(void)makeConfirmbuttonWithfatherview:(UIView *)fatherview
{
    UIScrollView *confirm_view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, 0)];
    NSString *confirm_text = @"选定条件后,点击”确定“以继续 >";
    CGFloat confirm_textW = [self calculateSizeWithFont:9 Width:MAXFLOAT Height:MAXFLOAT Text:confirm_text].size.width;
    CGFloat confirm_textX = MJMWIDTH-confirm_textW-60;
    CGFloat confirm_textY = 5;
    CGFloat confirm_textH = 30;
    UILabel *confirm_label = [[UILabel alloc] initWithFrame:CGRectMake(confirm_textX, confirm_textY, confirm_textW, confirm_textH)];
    confirm_label.text = confirm_text;
    confirm_label.font = [UIFont systemFontOfSize:9];
    confirm_label.textAlignment = NSTextAlignmentCenter;
    [confirm_view addSubview:confirm_label];
    
    UIButton *confirm_button = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(confirm_label.frame)+5, 5, 50, 20)];
    [confirm_button setTitle:@"确定" forState:0];
    [confirm_button setTitleColor:main_color forState:0];
    confirm_button.titleLabel.font = [UIFont systemFontOfSize:11];
    confirm_button.layer.cornerRadius = 3;
    confirm_button.layer.borderColor = [line_gray CGColor];
    confirm_button.layer.borderWidth = 0.5;
    [confirm_button setBackgroundColor:[UIColor whiteColor]];
    [confirm_button.layer setMasksToBounds:YES];
    [confirm_button addTarget:self
                       action:@selector(confirmbuttonClicked)
             forControlEvents:1 << 6];
    [confirm_view addSubview:confirm_button];
    
    UIView *confirm_line = [[UIView alloc] initWithFrame:CGRectMake(0, 29, MJMWIDTH, 1)];
    confirm_line.backgroundColor = line_gray;
    [confirm_view addSubview:confirm_line];
    
    _confirm_view = confirm_view;
    [fatherview addSubview:_confirm_view];
}

-(void)confirmbuttonClicked
{
    if ([self.delegate respondsToSelector:@selector(confirmbuttonclickedwithselectArray:)]) {
        [self.delegate confirmbuttonclickedwithselectArray:_selbutton_nameArray];
    }
}

// type:类型 array:科幻、爱情、喜剧
-(void)makeDetailscontentWitharray:(NSArray *)array type:(NSString *)type fatherview:(UIView *)fatherview positionY:(CGFloat)positionY index:(NSInteger)index
{
    UIView *details_view = [[UIView alloc] init];
    UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(distanceBetweenButton, 20, 100, 30)];
    title_label.text = type;
    title_label.font = [UIFont systemFontOfSize:13];
    [details_view addSubview:title_label];
    
    UIView *line_view = [[UIView alloc] init];
    line_view.frame = CGRectMake(distanceBetweenButton, CGRectGetMaxY(title_label.frame), MJMWIDTH-distanceBetweenButton, 1);
    line_view.backgroundColor = line_gray;
    [details_view addSubview:line_view];
    
    CGFloat rows = (array.count-1)/4 +1;
    UIView *content_view = [[UIView alloc] init];
    content_view.frame = CGRectMake(0, CGRectGetMaxY(line_view.frame) + 5, MJMWIDTH, rows*30);
    for (int i=0; i<array.count; i++) {
        NSInteger row = i/4;
        NSInteger position = i%4+1;
        NSString *content_title = array[i];
        CGFloat button_width = (MJMWIDTH - 5*distanceBetweenButton)/4;
        UIButton *content_single_button = [[UIButton alloc] initWithFrame:CGRectMake(position*distanceBetweenButton + (position-1)*button_width,row*30 + 5, button_width, 20)];
        [content_single_button setTitle:content_title forState:0];
        [content_single_button setTitleColor:font_gray forState:0];
        content_single_button.titleLabel.font = [UIFont systemFontOfSize:11];
        content_single_button.layer.cornerRadius = 3;
        content_single_button.layer.borderColor = [font_gray CGColor];
        content_single_button.layer.borderWidth = 0.5;
        [content_single_button.layer setMasksToBounds:YES];
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
        
        [content_view addSubview:content_single_button];
    }
    [details_view addSubview:content_view];
    max_y += CGRectGetMaxY(content_view.frame);
    details_view.frame = CGRectMake(0,positionY, MJMWIDTH, CGRectGetMaxY(content_view.frame));
    [fatherview addSubview:details_view];
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
