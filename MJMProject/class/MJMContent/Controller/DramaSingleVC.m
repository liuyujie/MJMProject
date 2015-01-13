//
//  DramaSingleVC.m
//  MJMProject
//
//  Created by bassamyan on 15/1/13.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DramaSingleVC.h"

@interface DramaSingleVC ()

@end

@implementation DramaSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize bounds = self.navigationController.navigationBar.frame.size;
    self.navigationController.navigationBar = [self makeCustomNavbarWithBounds:bounds];
    
}

-(UINavigationBar *)makeCustomNavbarWithBounds:(CGSize)Bounds
{
    UINavigationBar *customBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, Bounds.width, Bounds.height)];
    
    return customBar;
}

-(BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

@end
