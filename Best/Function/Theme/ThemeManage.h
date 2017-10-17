//
//  ThemeManage.h
//  Best
//
//  Created by Gabriella on 2017/10/5.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManage : NSObject

@property (nonatomic,copy)NSString          *themeName; //当前主题名

@property (nonatomic,strong)NSDictionary    *configTheme; //配置主题的Plist文件

@property (nonatomic,strong)NSDictionary    *configColor; //配置主题的颜色的Plist文件


SINGLETON_FOR_HEADER(ThemeManage)

// 通过图片名获取图片
-(UIImage *)getThemeImg:(NSString *)imgName;

// 通过当前主题获取相应的color
-(UIColor *)getThemeColor:(NSString *)colorName;

// 通过名字获取字体
-(UIFont *)getThemeFont:(NSString *)fontName;
@end
