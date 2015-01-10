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
#import "CellData.h"

@interface MJMContentController ()<ContentSelectionButtonDelegate,ContentSelectionDetailsDelegate,UITableViewDelegate,UITableViewDataSource>
{
    ContentSelectionDetails *selection_detailsView;
    ContentSelectionButton *selec_button;
    BOOL isset;//是否已经出现selection view
    NSArray *list_array;
}
@property (nonatomic,strong) NSMutableArray *data_array;
@end

@implementation MJMContentController

-(NSMutableArray *)data_array
{
    if (_data_array == nil) {
        _data_array = [NSMutableArray array];
    }
    return _data_array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CellData *data = [[CellData alloc] init];
    _data_array = [data makeCelldatawithoptions:nil];
    
    ContentSelectionButton *selection_button = [[ContentSelectionButton alloc] initWithFrame:CGRectMake(MJMWIDTH-content_selectionbutton_width, 0, content_selectionbutton_width, contentSelectionHeight-1)];
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
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.backgroundColor = tabbar_hudgray;
    [self.view insertSubview:tableview belowSubview:selection_details];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data_array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"contact";
    ContentDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ContentDetailsCell alloc] init];
        [cell makeContentdetailscellWithDic:_data_array[indexPath.row]];
        
        UIView *backgroundView = [[UIView alloc]initWithFrame:cell.frame];
        backgroundView.backgroundColor = tabbar_hudgray;
        cell.selectedBackgroundView = backgroundView;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentDetailCellFrame *frame = [[ContentDetailCellFrame alloc] init];
    return [frame calculateContentcellFrameWithDatadic:_data_array[indexPath.row]];
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
