//
//  MJMTabbar.h
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJMTabbar;

@protocol MJMTabbarDelegate <NSObject>
@optional
- (void)tabBar:(MJMTabbar *)tabBar didSelectButtonFrom:(int)from to:(int)to;
@end


@interface MJMTabbar : UIView

@property (nonatomic, weak) id<MJMTabbarDelegate> delegate;
- (void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName title:(NSString *)title i:(NSInteger)i;

@end