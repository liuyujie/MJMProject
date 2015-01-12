//
//  MJMTabbarController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMTabbarController.h"
#import "MJMContactController.h"
#import "MJMContentController.h"
#import "MJMLunTanController.h"
#import "MJMSettingController.h"
#import "MJMTabbar.h"
#import "MJMBaseController.h"

@interface MJMTabbarController ()<MJMTabbarDelegate>

@end

@implementation MJMTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array_title = @[@"美剧迷",@"论坛",@"联系",@"设置"];
    
    MJMContentController *contentVC = [[MJMContentController alloc] init];
    contentVC.title = array_title[0];
    MJMBaseController *contentNav = [[MJMBaseController alloc] initWithRootViewController:contentVC];
    
    MJMLunTanController *luntanVC = [[MJMLunTanController alloc] init];
    luntanVC.title = array_title[1];
    MJMBaseController *luntanNav = [[MJMBaseController alloc] initWithRootViewController:luntanVC];
    
    MJMContactController *contactVC = [[MJMContactController alloc] init];
    contactVC.title = array_title[2];
    MJMBaseController *contactNav = [[MJMBaseController alloc] initWithRootViewController:contactVC];
    
    MJMSettingController *settingVC = [[MJMSettingController alloc] init];
    settingVC.title = array_title[3];
    MJMBaseController *settingNav = [[MJMBaseController alloc] initWithRootViewController:settingVC];
    
    self.viewControllers = [NSArray arrayWithObjects:contentNav,luntanNav,contactNav,settingNav, nil];
    
    MJMTabbar *tabbar = [[MJMTabbar alloc] init];
    tabbar.delegate = self;
    tabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabbar];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [tabbar addTabButtonWithName:name selName:selName title:array_title[i] i:i];
    }
    
}

- (void)tabBar:(MJMTabbar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    // 选中最新的控制器
    self.selectedIndex = to;
}
@end
