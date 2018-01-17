//
//  MeVC.m
//  Best
//
//  Created by Gabriella on 2017/10/20.
//  Copyright © 2017年 Gabriella. All rights reserved.
/**
 可以横竖屏
 */

#import "MeVC.h"

@interface MeVC ()<UINavigationControllerDelegate>

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
}

#pragma mark ------------------------ UINavigationControllerDelegate  将要显示控制器隐藏导航栏
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [viewController.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
