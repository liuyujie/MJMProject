//
//  MJMContentController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMContentController.h"
#import "ContentSelection.h"
#import "ContentSelectionDetails.h"
#import "ContentSelectionButton.h"
#import "UIImage+MJM.h"

@interface MJMContentController ()<ContentSelectionDelegate>
{
    ContentSelectionDetails *selection_detailsView;
    BOOL isset;
}
@end

@implementation MJMContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    ContentSelection *contentSelection = [[ContentSelection alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    contentSelection.delegate = self;
    [self.view addSubview:contentSelection];
    
    ContentSelectionDetails *selection_details = [[ContentSelectionDetails alloc] initWithFrame:CGRectMake(0,30,MJMWIDTH,0)];
    selection_detailsView = selection_details;
    isset = NO;
    [self makeSelectionbuttonWithfatherView:self.view positionX:MJMWIDTH - 30];
    [self.view addSubview:selection_detailsView];
}

-(void)makeSelectionbuttonWithfatherView:(UIView *)fatherView positionX:(CGFloat)positionX
{
    ContentSelectionButton *button = [[ContentSelectionButton alloc] initWithFrame:CGRectMake(positionX, 0, content_selectionbutton_width, contentSelectionHeight)];
    [button setBackgroundColor:tabbar_hudgray];
    [button setImage:[UIImage resizedImageWithName:@"arrow_darkgray.png"] forState:0];
    [button setImage:[UIImage resizedImageWithName:@"arrow_darkgray.png"] forState:1 << 0];
    [button addTarget:self
               action:@selector(selectionbuttonDidClicked:)
     forControlEvents:1 << 6];
    [fatherView addSubview:button];
}

-(void)selectionbuttonDidClicked:(ContentSelectionButton *)button
{
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = button.imageView.transform;
        button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
    }];
    
    
    if (isset) {
        isset = NO;
        [UIView animateWithDuration:content_viewshow_duration animations:^{
            selection_detailsView.frame = CGRectMake(0, 30, MJMWIDTH, 0);
            selection_detailsView.details_tableview.frame = CGRectMake(0, 0, MJMWIDTH, 0);
        }];
    }
    else
    {
        isset = YES;
        [UIView animateWithDuration:content_viewshow_duration animations:^{
            selection_detailsView.frame = CGRectMake(0, 30, MJMWIDTH, MJMHEIGHT-30);
            selection_detailsView.details_tableview.frame = CGRectMake(0, 0, MJMWIDTH, MJMHEIGHT-30);
        }];
    }
    
    
}


@end
