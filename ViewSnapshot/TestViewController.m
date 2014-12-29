//
//  TestViewController.m
//  ViewSnapshot
//
//  Created by SalCat on 12/29/14.
//  Copyright (c) 2014 SalCat. All rights reserved.
//

#import "TestViewController.h"
#import "GraphicsView.h"

@interface TestViewController()
@property (nonatomic) UIView *subView0;
@end
@implementation TestViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    _subView0 = [[GraphicsView alloc] initWithFrame:CGRectMake(0, 64, 1024, 702)];
    [self.view addSubview:_subView0];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UINavigationItem *navItem = self.navigationItem;
    UIBarButtonItem *snapchatButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                    target:self
                                                                                    action:@selector(createSnapshot)];
    
    NSArray *rightBarButtonItems = [NSArray arrayWithObject:snapchatButton];
    
    [navItem setRightBarButtonItems:rightBarButtonItems
                           animated:YES];
}

-(void)createSnapshot {
    CGSize size = self.subView0.layer.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self.subView0.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(screenshotImage, nil, nil, nil);
}
@end

