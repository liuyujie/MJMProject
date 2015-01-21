//
//  MJMContentMoreController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMContentMoreController.h"
#import "ContentMoreCell.h"
#import "ContentMoreCellFrame.h"
#import "MainData.h"
#import "MJRefresh.h"
#import "DramaSingleVC.h"

@interface MJMContentMoreController ()
{
    //已获得的数据数目
    NSInteger index;
}
@property (nonatomic,strong) NSMutableArray *moreDrama_Array;
@end

@implementation MJMContentMoreController

-(NSMutableArray *)moreDrama_Array
{
    if (_moreDrama_Array == nil) {
        _moreDrama_Array = [NSMutableArray array];
    }
    return _moreDrama_Array;
}

/***************************
 
 上一级菜单选择的 美剧属性（类别、时间、公司）
 
 ***************************/
-(void)setOptions_Array:(NSArray *)options_Array
{
    _options_Array = options_Array;
}

/***************************
 
 选择类别（最新、点击最多、评分最高）
 
 ***************************/
-(void)setType:(NSString *)type
{
    _type = type;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = scrollview_gray;
    self.title = @"更多美剧";
    MainData *moreDramas = [[MainData alloc] init];
    self.moreDrama_Array = [moreDramas makeContentMoreDramasWithOptions:self.options_Array type:self.type index:0];
    index = self.moreDrama_Array.count;
    
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    self.tableView.contentInset = UIEdgeInsetsMake(-5, 0, 0, 0);
    
}

- (void)footerRereshing
{
    MainData *moreDramas = [[MainData alloc] init];
    NSMutableArray *moreData_Array = [moreDramas makeContentMoreDramasWithOptions:self.options_Array type:self.type index:index];
    if (moreData_Array.count > 0) {
        index += moreData_Array.count;
        for (int i=0; i<moreData_Array.count; i++) {
            NSMutableDictionary *dic = moreData_Array[i];
            [_moreDrama_Array addObject:dic];
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"没有更多消息了"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"好"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.moreDrama_Array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"content";
    ContentMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ContentMoreCell alloc] init];
        [cell makeContentMoreCellWithDramainfoarray:self.moreDrama_Array[indexPath.row]];
        
        UIView *backgroundView = [[UIView alloc]initWithFrame:cell.frame];
        backgroundView.backgroundColor = tabbar_hudgray;
        cell.selectedBackgroundView = backgroundView;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContentMoreCellFrame *cellframe = [[ContentMoreCellFrame alloc] init];
    return [cellframe calculateCellFrameWithdramainfoarray:self.moreDrama_Array[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DramaSingleVC *drama_view = [[DramaSingleVC alloc] init];
    
    [self.navigationController pushViewController:drama_view animated:YES];
}

-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

@end
