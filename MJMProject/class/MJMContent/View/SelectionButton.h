//
//  SelectionButton.h
//  MJMProject
//
//  Created by bassamyan on 15/1/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectionButtonDelegate <NSObject>

@optional
-(void)selectionbuttonDidClickedWithbutton:(UIButton *)button;
@end

@interface SelectionButton : UIButton
@property (nonatomic,weak) id<SelectionButtonDelegate> delegate;
@end
