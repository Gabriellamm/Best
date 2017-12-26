//
//  TestNextViewController.m
//  Best
//
//  Created by Gabriella on 2017/11/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "TestNextViewController.h"

@interface TestNextViewController ()

@end

@implementation TestNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    button.frame = CGRectMake(0, 0, 50, 50);
    button.center = self.view. center;
    [button setTitle:@"check" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}


-(void)btnAction:(UIButton *)btn{
//[self dismissViewControllerAnimated:YES completion:^{
//    DDLOG(@"我消失了") ;
//}];

    [self.navigationController popViewControllerAnimated:YES];

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
