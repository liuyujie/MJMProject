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
#import "SelectionHeadButton.h"
#import "ContentMainview.h"
#import "MainData.h"
#import "SelectionButton.h"
#import "MJMContentMoreController.h"
#import "SelectionDetailsData.h"
#import "DramaSingleVC.h"
#import "MJMTabbar.h"
#import "KKNavigationController.h"

@interface MJMContentController ()<ContentSelectionDetailsDelegate,ContentMainviewDelegate,SelectionButtonDelegate,SelectionHeadButtonDelegate>
{
    ContentSelectionDetails *selection_detailsView;
    BOOL isset;//是否已经出现selection view
    NSArray *list_array;
    ContentMainview *main_View;
    SelectionButton *selection_button;
    CGFloat nav_height;
    NSMutableArray *selection_Array;
    ContentSelectionView *contentSelection;
}
@end
@implementation MJMContentController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = scrollview_gray;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //获取数据
    SelectionDetailsData *selection_Data = [[SelectionDetailsData alloc] init];
    selection_Array = [selection_Data makeSelectionDetailsData];
    list_array = [selection_Data makefirstSelectionArrayWithArray:selection_Array];
 
    //导航栏
    contentSelection = [[ContentSelectionView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    contentSelection.first_selection = list_array;
    [self.view addSubview:contentSelection];
    
    //头像
    SelectionHeadButton *headImage_button = [[SelectionHeadButton alloc] initWithFrame:CGRectMake(5, 0, 45, 45)];
    [self.view insertSubview:headImage_button aboveSubview:contentSelection];
    
    //按钮
    CGFloat view_width = 25;
    selection_button = [[SelectionButton alloc] initWithFrame:CGRectMake(MJMWIDTH-view_width, 0, view_width, view_width)];
    selection_button.delegate = self;
    [self.view insertSubview:selection_button aboveSubview:contentSelection];
    
    //设置scrollview
    [self makeMainscrollviewWithOptions:nil];
}


/***************************
 
 点击头像 跳出个人详细页面
 
 ***************************/

-(void)headImageClickWithPersoninfo:(NSString *)personinfo
{
    NSLog(@"head image click");
}

/***************************
 
 点击一个美剧 跳出详细信息
 
 ***************************/

-(void)dramaviewdidClickWithdramaID:(NSInteger)dramaID
{
    DramaSingleVC *single_view = [[DramaSingleVC alloc] init];
    // 采用新浪微博 效果

    single_view.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:single_view
                       animated:YES
                     completion:^{
                         
                     }];
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
    }
    //主要内容
    ContentMainview *main_view = [[ContentMainview alloc] initWithFrame:CGRectMake(0,contentSelectionHeight, MJMWIDTH, mainview_height)];
    [main_view makeMaincontentWithDramaArray:main_data_array];
    main_view.delegate = self;
    main_View = main_view;
    if (selection_detailsView == nil) {
        [self.view insertSubview:main_view belowSubview:contentSelection];
    }
    else
    {
        [self.view insertSubview:main_view belowSubview:selection_detailsView];
    }
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
    if (selection_detailsView == nil) {
        //下拉菜单 属性选择 确定按钮点击事件
        selection_detailsView = [[ContentSelectionDetails alloc] initWithFrame:CGRectMake(0,contentSelectionHeight-MJMHEIGHT,MJMWIDTH,MJMHEIGHT-30)];
        selection_detailsView.selection_Array = selection_Array;
        selection_detailsView.delegate = self;
        isset = NO;
        [self.view insertSubview:selection_detailsView belowSubview:contentSelection];
    }

    
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
