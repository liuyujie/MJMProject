//
//  MJMContentController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMContentController.h"
#import "ContentSelectionDetails.h"
#import "UIImage+MJM.h"
#import "ContentSelectionView.h"
#import "ContentTableview.h"
#import "SelectionHeadButton.h"
#import "ContentMainview.h"
#import "MainData.h"
#import "SelectionButton.h"
#import "MJMContentMoreController.h"
#import "SelectionDetailsData.h"
#import "DramaSingleView.h"

@interface MJMContentController ()<ContentSelectionDetailsDelegate,ContentMainviewDelegate,SelectionButtonDelegate>
{
    ContentSelectionDetails *selection_detailsView;
    BOOL isset;//是否已经出现selection view
    NSArray *list_array;
    ContentMainview *main_View;
    SelectionButton *selection_button;
}
@end
@implementation MJMContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SelectionDetailsData *selection_Data = [[SelectionDetailsData alloc] init];
    NSMutableArray *selection_Array = [selection_Data makeSelectionDetailsData];
    list_array = [selection_Data makefirstSelectionArrayWithArray:selection_Array];
    
    //按钮
    CGFloat view_width = 25;
    selection_button = [[SelectionButton alloc] initWithFrame:CGRectMake(MJMWIDTH-view_width, 0, view_width, view_width)];
    selection_button.delegate = self;
    [self.view addSubview:selection_button];
    
    //头像
    SelectionHeadButton *headImage_button = [[SelectionHeadButton alloc] initWithFrame:CGRectMake(5, 0, 45, 45)];
    [self.view addSubview:headImage_button];
    
    //导航栏
    ContentSelectionView *contentSelection = [[ContentSelectionView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    contentSelection.first_selection = list_array;
    [self.view insertSubview:contentSelection belowSubview:selection_button];
    
    //下拉菜单 属性选择 确定按钮点击事件
    ContentSelectionDetails *selection_details = [[ContentSelectionDetails alloc] initWithFrame:CGRectMake(0,contentSelectionHeight-MJMHEIGHT,MJMWIDTH,MJMHEIGHT-30)];
    selection_details.selection_Array = selection_Array;
    selection_details.delegate = self;
    selection_detailsView = selection_details;
    isset = NO;
    [self.view insertSubview:selection_detailsView belowSubview:contentSelection];
    
    //设置scrollview
    [self makeMainscrollviewWithOptions:nil];
}

/***************************
 
 点击一个美剧 跳出详细信息
 
 ***************************/

-(void)dramaviewdidClickWithdramaID:(NSInteger)dramaID
{
    NSLog(@"%d",(int)dramaID);
    DramaSingleView *single_view = [[DramaSingleView alloc] init];
    // 采用新浪微博 效果
    [self.navigationController pushViewController:single_view animated:YES];
}

/***************************
 
 美剧更多按钮
 
 ***************************/
- (void)dramasMoreWithCondition:(NSString *)Condition
{
    MJMContentMoreController *more_VC = [[MJMContentMoreController alloc] init];
    more_VC.options_Array = list_array;
    more_VC.type = Condition;
    [self.navigationController pushViewController:more_VC animated:YES];
}

/***************************
 
 通过选择的属性和值 创建主界面
 （类型、时间、公司）
 
 ***************************/

-(void)makeMainscrollviewWithOptions:(NSArray *)options
{
    MainData *main_data = [[MainData alloc] init];
    NSMutableArray *main_data_array = [main_data makeMaindataWithOptions:options];
    CGFloat mainview_height = MJMHEIGHT-contentSelectionHeight-49;
    
    if (main_View != nil) {
        [main_View removeFromSuperview];
        main_View = nil;
        mainview_height -= 49;
    }
    //主要内容
    ContentMainview *main_view = [[ContentMainview alloc] initWithFrame:CGRectMake(0,contentSelectionHeight, MJMWIDTH, mainview_height)];
    [main_view makeMaincontentWithDramaArray:main_data_array];
    main_view.delegate = self;
    main_View = main_view;
    [self.view insertSubview:main_View belowSubview:selection_detailsView];
}


/***************************
 
 下拉 选择属性菜单里的确定按钮点击事件
 
 ***************************/
-(void)confirmbuttonclickedwithselectArray:(NSArray *)array
{
    isset = NO;
    list_array = array;
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = selection_button.imageView.transform;
        selection_button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
        selection_detailsView.transform = CGAffineTransformMakeTranslation(0, -MJMHEIGHT);
    }];
    [self makeMainscrollviewWithOptions:array];
}


/***************************
 
 右上角 下拉菜单点击按钮点击时间
 
 ***************************/

-(void)selectionbuttonDidClickedWithbutton:(UIButton *)button
{
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = button.imageView.transform;
        button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
    }];
    
    if (isset) {
        isset = NO;
        [UIView animateWithDuration:content_viewshow_duration animations:^{
            selection_detailsView.transform = CGAffineTransformMakeTranslation(0, -MJMHEIGHT);
        }];
        return;
    }
    isset = YES;
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        selection_detailsView.transform = CGAffineTransformMakeTranslation(0, MJMHEIGHT);
    }];

}



@end
