//
//  MJMBaseController.m
//  MJMProject
//
//  Created by bassamyan on 15/1/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MJMBaseController.h"


@interface MJMBaseController ()

@end

@implementation MJMBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTranslucent:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationBar.backgroundColor = [UIColor blackColor];
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navbar_background"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *attri = [NSMutableDictionary dictionary];
    attri[NSForegroundColorAttributeName] = [UIColor whiteColor];
    navBar.titleTextAttributes = attri;
}



- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

@end
