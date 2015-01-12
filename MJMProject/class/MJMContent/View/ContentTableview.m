//
//  ContentTableview.m
//  MJMProject
//
//  Created by bassamyan on 15/1/11.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ContentTableview.h"
#import "ContentDetailsCell.h"
#import "ContentDetailCellFrame.h"
#import "CellData.h"

@interface ContentTableview() <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *data_array;
@end

@implementation ContentTableview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CellData *data = [[CellData alloc] init];
        _data_array = [data makeCelldatawithoptions:nil];
        
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = tabbar_hudgray;
    }
    return self;
}


-(NSMutableArray *)data_array
{
    if (_data_array == nil) {
        _data_array = [NSMutableArray array];
    }
    return _data_array;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data_array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"content";
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
@end
