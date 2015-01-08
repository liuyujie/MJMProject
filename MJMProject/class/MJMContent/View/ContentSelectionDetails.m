//
//  ContentSelectionDetails.m
//  MJMProject
//
//  Created by ; on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentSelectionDetails.h"

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


-(void)makeDetailsviewWithframe:(CGRect)frame;
{
    max_y = 0;
    self.frame = frame;
    _details_tableview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,MJMWIDTH,0)];

    
    NSArray *array1 = @[@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻",@"科幻"];
    NSArray *array2 = @[@"2015",@"2015",@"2015",@"2015",@"2015",@"2015",@"2015"];
    NSArray *array3 = @[@"最新",@"最新",@"最新",@"最新",@"最新"];
    
    [self makeDetailscontentWitharray:array1 type:@"美剧类型" fatherview:_details_tableview positionY:max_y index:0];
    [self makeDetailscontentWitharray:array2 type:@"首发时间" fatherview:_details_tableview positionY:max_y index:1];
    [self makeDetailscontentWitharray:array3 type:@"程度" fatherview:_details_tableview positionY:max_y index:2];
    _details_tableview.contentSize = CGSizeMake(MJMWIDTH, max_y+200);
    [self addSubview:_details_tableview];
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
    
    CGFloat rows = array.count/4 +1;
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
        }
        [content_single_button addTarget:self
                                  action:@selector(detailscontentbuttonClicked:)
                        forControlEvents:1 << 6];
        [content_view addSubview:content_single_button];
    }
    [details_view addSubview:content_view];
    max_y += CGRectGetMaxY(content_view.frame);
    details_view.frame = CGRectMake(0,positionY, MJMWIDTH, max_y);
    [fatherview addSubview:details_view];
}

-(void)detailscontentbuttonClicked:(UIButton *)button
{
    [_selbuttonArray[button.tag] setBackgroundColor:[UIColor whiteColor]];
    [_selbuttonArray[button.tag] setTitleColor:font_gray forState:0];
    _selbuttonArray[button.tag] = button;
    [button setBackgroundColor:main_color];
    [button setTitleColor:[UIColor whiteColor] forState:0];
}



@end
