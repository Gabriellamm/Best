//
//  MBProgressHUD+M.m
//  Best
//
//  Created by Gabriella on 2017/9/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "MBProgressHUD+M.h"
#import "AppDelegate+AppServise.h"

const NSInteger hideTime = 2;

@implementation MBProgressHUD (M)



+ (void)showErrorMessage:(NSString *)Message{

}
//
+ (void)showWarnMessage:(NSString *)Message{

}

-(void)showCustomIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow{
    MBProgressHUD *hud  =  [MBProgressHUD createMBProgressHUDViewWithMessage:message isWindow:isWindow];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
//    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:hideTime];

}


+(MBProgressHUD *)createMBProgressHUDViewWithMessage:(NSString *)message isWindow:(BOOL)isWindow{



        UIView  *view = isWindow? (UIView*)KAppWindow:[(AppDelegate *)KAppDelegate getCurrentUIVC].view;

    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        [hud showAnimated:YES];
    }
    hud.minSize = CGSizeMake(100, 100);
    hud.label.text = message?message:@"加载中。。。";
    hud.label.font = [UIFont systemFontOfSize:15];
    hud.label.textColor = KWhiteColor;
    hud.label.numberOfLines  = 0;
//    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.9];
    hud.removeFromSuperViewOnHide = YES;
    [hud setContentColor:KWhiteColor];
//        hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];

    return hud;


}
@end
