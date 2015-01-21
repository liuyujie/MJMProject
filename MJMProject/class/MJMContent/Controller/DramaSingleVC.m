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
  
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


@end
