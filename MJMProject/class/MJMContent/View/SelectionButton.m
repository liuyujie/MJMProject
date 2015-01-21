//
//  SelectionButton.m
//  MJMProject
//
//  Created by bassamyan on 15/1/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SelectionButton.h"
#import "UIImage+MJM.h"

@implementation SelectionButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //按钮
        [self setImage:[UIImage resizedImageWithName:@"content_selectionview_arrow.png"] forState:0];
        [self setImage:[UIImage resizedImageWithName:@"content_selectionview_arrow.png"] forState:1<<0];
        self.backgroundColor = main_color;
        self.layer.shadowOffset = CGSizeMake(-3, -3);
        self.layer.shadowColor = [main_color CGColor];
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.8f;
        
        [self addTarget:self
                 action:@selector(selectionbtnDidClickedWithbutton:)
       forControlEvents:1 << 6];
    }
    return self;
}

-(void)selectionbtnDidClickedWithbutton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(selectionbuttonDidClickedWithbutton:)]) {
        [self.delegate selectionbuttonDidClickedWithbutton:button];
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(3.5, 3.5, 18, 18);
}

@end
