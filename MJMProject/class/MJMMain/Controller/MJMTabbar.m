//
//  MJMTabbar.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMTabbar.h"
#import "MJMTabbarButton.h"
#import "UIImage+MJM.h"

@interface MJMTabbar()
@property (nonatomic, weak) MJMTabbarButton *selectedButton;
@end

@implementation MJMTabbar

- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName title:(NSString *)title i:(NSInteger)i
{
    self.backgroundColor = [UIColor whiteColor];
    
    MJMTabbarButton *button = [MJMTabbarButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage resizedImageWithName:selName] forState:UIControlStateSelected];
    [button setTitle:title forState:0];
    button.imageView.contentMode    = UIViewContentModeCenter;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font          = [UIFont systemFontOfSize:font_tabbar];
    [button.titleLabel setTintColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor blackColor] forState:0];
    if (self.subviews.count == 0) {
        [self buttonClick:button];
    }
    [self addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    CGFloat buttonSize = MJMWIDTH / count;
    for (int i = 0; i<count; i++) {
        MJMTabbarButton *button = self.subviews[i];
        button.tag = i;
        button.frame = CGRectMake(buttonSize * i, 0, buttonSize, self.frame.size.height);
    }
}

- (void)buttonClick:(MJMTabbarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
