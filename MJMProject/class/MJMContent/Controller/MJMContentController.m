//
//  MJMContentController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMContentController.h"
#import "ContentSelectionDetails.h"
#import "ContentSelectionButton.h"
#import "UIImage+MJM.h"
#import "ContentSelectionView.h"

@interface MJMContentController ()<ContentSelectionButtonDelegate,ContentSelectionDetailsDelegate>
{
    ContentSelectionDetails *selection_detailsView;
    ContentSelectionButton *selec_button;
    BOOL isset;//是否已经出现selection view
}
@end

@implementation MJMContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    ContentSelectionView *contentSelection = [[ContentSelectionView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    [self.view addSubview:contentSelection];
    
    ContentSelectionDetails *selection_details = [[ContentSelectionDetails alloc] initWithFrame:CGRectMake(0,contentSelectionHeight,MJMWIDTH,0)];
    selection_detailsView = selection_details;
    selection_detailsView.delegate = self;
    isset = NO;
    
    [self.view addSubview:selection_detailsView];
    
    ContentSelectionButton *selection_button = [[ContentSelectionButton alloc] initWithFrame:CGRectMake(MJMWIDTH-content_selectionbutton_width, 0, content_selectionbutton_width, contentSelectionHeight)];
    selection_button.delegate = self;
    selec_button = selection_button;
    [self.view addSubview:selec_button];
}


-(void)confirmbuttonclickedwithselectArray:(NSArray *)array
{
    selection_detailsView.hidden = YES;
    isset = NO;
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = selec_button.imageView.transform;
        selec_button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
    }];
}

-(void)selectionbuttonDidClickedWithbutton:(ContentSelectionButton *)button
{
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = button.imageView.transform;
        button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
    }];
    
    if (isset) {
        isset = NO;
        selection_detailsView.hidden = YES;
        [UIView animateWithDuration:content_viewshow_duration animations:^{
            selection_detailsView.frame = CGRectMake(0, contentSelectionHeight, MJMWIDTH, 0);
            selection_detailsView.details_tableview.frame = CGRectMake(0, 30, MJMWIDTH, 0);
        }];
        selection_detailsView.confirm_view.frame = CGRectMake(0, 0, MJMWIDTH, 0);
        return;
    }
    isset = YES;
    selection_detailsView.hidden = NO;
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        selection_detailsView.frame = CGRectMake(0, contentSelectionHeight, MJMWIDTH, MJMHEIGHT-contentSelectionHeight);
        selection_detailsView.details_tableview.frame = CGRectMake(0, 30, MJMWIDTH, MJMHEIGHT-contentSelectionHeight);
    }];
    selection_detailsView.confirm_view.frame = CGRectMake(0, 0, MJMWIDTH, 30);
}



@end
