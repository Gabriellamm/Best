//
//  RootNavigationVC.m
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "RootNavigationVC.h"

@interface RootNavigationVC ()

@end

@implementation RootNavigationVC


//  App 生命周期中 只会执行一次
+(void)initialize{

#warning  最好使用全局的？？？
    UINavigationBar *navar = [UINavigationBar appearance];
    [navar setBarTintColor:CNavBgColor];
    [navar setTintColor:CNavBgFontColor];
    NSDictionary *attritubutes = @{NSForegroundColorAttributeName:CNavBgFontColor ,NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [navar setTitleTextAttributes:attritubutes];


    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

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
