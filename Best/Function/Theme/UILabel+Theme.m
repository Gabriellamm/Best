//
//  UILabel+Theme.m
//  Best
//
//  Created by Gabriella on 2017/10/5.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "UILabel+Theme.h"
#import "ThemeManage.h"


@implementation UILabel (Theme)

//-(void)setThemeColorName:(NSString *)themeColorName{
//
//    if (themeColorName) {
//
//        objc_setAssociatedObject(self, @selector(themeColorName), themeColorName, OBJC_ASSOCIATION_COPY_NONATOMIC);
//
//
//
//        }
//
//
//
//}
//
//-(id)themeColorName{
//    return objc_getAssociatedObject(self, @selector(themeColorName));
//}


-(UIColor *)themeColor:(NSString *)colorName{
    UIColor * color = [[ThemeManage sharedThemeManage] getThemeColor:colorName];
    return color;
}
@end
