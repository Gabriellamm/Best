//
//  LoginViewController.m
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";

    YYLabel *snowBtn = [[YYLabel alloc] initWithFrame:CGRectMake(0, 200, 150, 60)];
    snowBtn.text = @"微信登录";
    snowBtn.font = SYSTEMFONT(20);
    snowBtn.textColor = KWhiteColor;
    snowBtn.backgroundColor = CNavBgColor2;
    snowBtn.textAlignment = NSTextAlignmentCenter;
    snowBtn.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    snowBtn.centerX = KScreenWidth/2;

    kWeakSelf(self)
    snowBtn.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        [weakself weiXinLogin];
    };
    [self.view addSubview:snowBtn];


    YYLabel *snowBtn2 = [[YYLabel alloc] initWithFrame:CGRectMake(0, 300, 150, 60)];
    snowBtn2.text = @"QQ登录";
    snowBtn2.font = SYSTEMFONT(20);
    snowBtn2.textColor = KWhiteColor;
    snowBtn2.backgroundColor = KRedColor;
    snowBtn2.textAlignment = NSTextAlignmentCenter;
    snowBtn2.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    snowBtn2.centerX = KScreenWidth/2;

    snowBtn2.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        //        [MBProgressHUD showTopTipMessage:NSStringFormat(@"%@马上开始",str) isWindow:YES];

        [weakself QQLogin];
    };

    [self.view addSubview:snowBtn2];

    YYLabel *skipBtn = [[YYLabel alloc] initWithFrame:CGRectMake(0, 400, 150, 60)];
    skipBtn.text = @"跳过登录";
    skipBtn.font = SYSTEMFONT(20);
    skipBtn.textColor = KBlueColor;
    skipBtn.backgroundColor = KClearColor;
    skipBtn.textAlignment = NSTextAlignmentCenter;
    skipBtn.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    skipBtn.centerX = KScreenWidth/2;

    skipBtn.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        //        [MBProgressHUD showTopTipMessage:NSStringFormat(@"%@马上开始",str) isWindow:YES];

        [weakself skipAction];
    };

    [self.view addSubview:skipBtn];
}


#pragma mark ************* 点击微信登录
-(void)weiXinLogin{
    [userManager login:KUserLoginTypeWeChat completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"微信登录成功");
        }else{
            DLog(@"微信登录失败");
        }
    }];
}

-(void)QQLogin{

}

-(void)skipAction{

    // 游客登录模式
    KPostNotification(KNotificationLoginState, @YES);
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
