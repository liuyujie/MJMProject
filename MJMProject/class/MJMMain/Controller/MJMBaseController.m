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
}



- (BOOL)hidesBottomBarWhenPushed
{
    return YES;
}

@end
