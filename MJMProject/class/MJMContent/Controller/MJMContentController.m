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
#import "ContentDetailsCell.h"
#import "ContentDetailCellFrame.h"

@interface MJMContentController ()<ContentSelectionButtonDelegate,ContentSelectionDetailsDelegate,UITableViewDelegate,UITableViewDataSource>
{
    ContentSelectionDetails *selection_detailsView;
    ContentSelectionButton *selec_button;
    BOOL isset;//是否已经出现selection view
}
@end

@implementation MJMContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ContentSelectionButton *selection_button = [[ContentSelectionButton alloc] initWithFrame:CGRectMake(MJMWIDTH-content_selectionbutton_width, 0, content_selectionbutton_width, contentSelectionHeight)];
    selection_button.delegate = self;
    selec_button = selection_button;
    [self.view addSubview:selec_button];
    
    ContentSelectionView *contentSelection = [[ContentSelectionView alloc] initWithFrame:CGRectMake(0, 0, MJMWIDTH, contentSelectionHeight)];
    [self.view insertSubview:contentSelection belowSubview:selection_button];
    
    ContentSelectionDetails *selection_details = [[ContentSelectionDetails alloc] initWithFrame:CGRectMake(0,contentSelectionHeight-MJMHEIGHT,MJMWIDTH,MJMHEIGHT-30)];
    selection_detailsView = selection_details;
    selection_detailsView.delegate = self;
    isset = NO;
    [self.view insertSubview:selection_detailsView belowSubview:contentSelection];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, contentSelectionHeight, MJMWIDTH, MJMHEIGHT-contentSelectionHeight)];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view insertSubview:tableview belowSubview:selection_details];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"contact";
    ContentDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ContentDetailsCell alloc] init];
        [cell makeContentdetailscell];
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentDetailCellFrame *frame = [[ContentDetailCellFrame alloc] init];
    return [frame calculateContentcellFrame];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)confirmbuttonclickedwithselectArray:(NSArray *)array
{
    isset = NO;
    [UIView animateWithDuration:content_viewshow_duration animations:^{
        CGAffineTransform rotation = selec_button.imageView.transform;
        selec_button.imageView.transform = CGAffineTransformRotate(rotation,M_PI);
        selection_detailsView.transform = CGAffineTransformMakeTranslation(0, -MJMHEIGHT);
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
