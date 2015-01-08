//
//  ContentDetailsCell.m
//  MJMProject
//
//  Created by bassamyan on 15/1/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentDetailsCell.h"

@implementation ContentDetailsCell

-(void)makeContentdetailscell
{
    UIView *cell_total = [[UIView alloc] init];
    
    ////////////////cell的头部
    ////////////////
    ////////////////
    UIView *cell_head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, 50)];
//    cell_head.backgroundColor = [UIColor yellowColor];
    UILabel *head_title = [self celllabelWithframe:CGRectMake(15, 5, 100, 20) font:11 text:@"闪电侠"];
    [cell_head addSubview:head_title];
    [cell_total addSubview:cell_head];
    
    ////////////////cell的内容
    ////////////////
    ////////////////
    UIView *cell_body = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_head.frame), MJMWIDTH, 200)];
    cell_body.backgroundColor = [UIColor greenColor];
    [cell_total addSubview:cell_body];
    
    
    ////////////////cell的尾部
    ////////////////
    ////////////////
    UIView *cell_foot = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cell_body.frame), MJMWIDTH, 30)];
    cell_foot.backgroundColor = [UIColor blueColor];
    [cell_total addSubview:cell_foot];
    
    cell_total.frame = CGRectMake(0, 0, MJMWIDTH, CGRectGetMaxY(cell_foot.frame));
    [self.contentView addSubview:cell_total];
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

-(UILabel *)celllabelWithframe:(CGRect)frame font:(NSInteger)font text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:font];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}
@end
