//
//  ContentSelectionDetails.h
//  MJMProject
//
//  Created by bassamyan on 15/1/7.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentSelectionDetailsDelegate <NSObject>

@optional
-(void)confirmbuttonclickedwithselectArray:(NSArray *)array;

@end

@interface ContentSelectionDetails : UIView
@property (nonatomic,weak) id<ContentSelectionDetailsDelegate> delegate;
@end
