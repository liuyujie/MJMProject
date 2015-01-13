//
//  SelectionHeadButton.h
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SelectionHeadButtonDelegate <NSObject>

@optional
-(void)headImageClickWithPersoninfo:(NSString *)personinfo;

@end
@interface SelectionHeadButton : UIView
@property (nonatomic,weak) id<SelectionHeadButtonDelegate> delegate;
@end
