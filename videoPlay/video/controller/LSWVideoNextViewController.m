//
//  LSWVideoNextViewController.m
//  videoPlay
//
//  Created by 梁世伟 on 2018/4/9.
//  Copyright © 2018年 梁世伟. All rights reserved.
//

#import "LSWVideoNextViewController.h"

@interface LSWVideoNextViewController ()

@end

@implementation LSWVideoNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}
- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
