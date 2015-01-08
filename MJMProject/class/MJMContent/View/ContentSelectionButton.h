//
//  ContentSelectionButton.h
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContentSelectionButton;
@protocol ContentSelectionButtonDelegate <NSObject>

@optional
-(void)selectionbuttonDidClickedWithbutton:(ContentSelectionButton *)button;
@end
@interface ContentSelectionButton : UIButton
@property (nonatomic,weak) id<ContentSelectionButtonDelegate> delegate;
@end
