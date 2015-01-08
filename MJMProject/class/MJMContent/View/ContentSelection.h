//
//  ContentSelection.h
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentSelectionDelegate <NSObject>
@optional
-(void)selectionbuttonDidClicked;
@end

@interface ContentSelection : UIView
@property (nonatomic,weak) id<ContentSelectionDelegate> delegate;


@end
