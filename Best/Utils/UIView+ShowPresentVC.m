//
//  UIView+ShowPresentVC.m
//  Best
//
//  Created by Gab on 2018/1/17.
//  Copyright © 2018年 Gabriella. All rights reserved.
//

#import "UIView+ShowPresentVC.h"

@implementation UIView (ShowPresentVC)

-(UIViewController *)ViewShowPresentVC:(NSString *) VCStr{
    UIWindow *currenW = [UIApplication sharedApplication].windows.firstObject;
    UIView *currentView = currenW.subviews.firstObject;
    UIResponder *res = [currentView nextResponder];
    while (res) {
        if ([res isKindOfClass:NSClassFromString(VCStr)]) {
            return (UIViewController *)res;
        }
        res = [res nextResponder];
    }
    return nil;
}

@end
