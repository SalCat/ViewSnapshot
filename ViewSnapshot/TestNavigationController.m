//
//  TestNavigationController.h
//  ViewSnapshot
//
//  Created by SalCat on 12/29/14.
//  Copyright (c) 2014 SalCat. All rights reserved.
//

#import "TestNavigationController.h"
#import "TestViewController.h"


@implementation TestNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIViewController *vCtl = [[TestViewController alloc] initWithNibName:nil bundle:nil];
    [self pushViewController:vCtl animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



