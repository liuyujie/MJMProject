//
//  ContentMainview.h
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentMainviewDelegate <NSObject>

@optional
-(void)dramasMoreWithCondition:(NSString *)Condition;
-(void)dramaviewdidClickWithdramaID:(NSInteger)dramaID;
@end

@interface ContentMainview : UIView
@property (nonatomic,weak) id<ContentMainviewDelegate> delegate;
-(void)makeMaincontentWithDramaArray:(NSMutableArray *)DramaArray;
@end
