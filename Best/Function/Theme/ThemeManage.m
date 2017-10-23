//
//  ThemeManage.m
//  Best
//
//  Created by Gabriella on 2017/10/5.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "ThemeManage.h"


@implementation ThemeManage

SINGLETON_FOR_CLASS(ThemeManage)

-(id)init{
    self = [super init];
    if (self) {

        [[NSNotificationCenter defaultCenter]postNotificationName:KThemeChangeNotification object:@"Blue Moon"];

        [[NSNotificationCenter defaultCenter ] addObserver:self selector:@selector(ThemeChageAction:) name:KThemeChangeNotification object:nil];


        _themeName = ThemeDefault;
// 本地缓存主题
        NSString *saveThemeName = [[NSUserDefaults standardUserDefaults]objectForKey:ThemeNameChange];
        if (saveThemeName.length ==0) {


            // 根据key 获取value  找到主题文件位置
        [self initThemePath];


        }else{
            _themeName = saveThemeName;
        }
    }

    return  self;
}


#pragma mark ************* function

-(void)ThemeChageAction:(NSNotification *)noti{

    NSString * themeName = noti.object;

    _themeName = themeName;

    [self initThemePath];



}

-(void)initThemePath{

    // 获取主题包信息
    NSString *themePathPlist = [[NSBundle mainBundle]pathForResource:@"theme.plist" ofType:nil];
    _configTheme = [NSDictionary dictionaryWithContentsOfFile:themePathPlist ];
}
// 获取包的主题的当前路径
-(NSString *)getCurrentThemePath{



    NSString * imgpathStr = [_configTheme objectForKey:_themeName];

    NSString *resourcePath = [NSBundle mainBundle].resourcePath;
    NSString *themePath = [resourcePath stringByAppendingPathComponent:imgpathStr];
    NSString * filePath = [themePath stringByAppendingPathComponent:@"config.plist"];
    _configColor = [NSDictionary dictionaryWithContentsOfFile:filePath];


    return themePath;
}


// 通过图片名获取图片
-(UIImage *)getThemeImg:(NSString *)imgName{

    if (imgName.length ==0) {
        return nil;
    }

    // 获取图片路径
    NSString * imgPath = [[self getCurrentThemePath] stringByAppendingPathComponent:imgName];
    UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    return img;



}

// 通过当前主题获取相应的color
-(UIColor *)getThemeColor:(NSString *)colorName{

    if (colorName.length == 0) {
        return nil;
    }

    NSDictionary * colorDic = [_configColor  objectForKey:colorName ];

    CGFloat R = [colorDic[@"R"] floatValue];
    CGFloat G = [colorDic[@"G"] floatValue];
    CGFloat B = [colorDic[@"B"] floatValue];
    CGFloat alpha = [colorDic[@"alpha"] floatValue];

    if (colorDic[@"alpha"] ==nil) {
        alpha = 1;
    }

    UIColor *color = KRGBColor(R, G, B, alpha);

    return color;

}

// 通过名字获取字体
-(UIFont *)getThemeFont:(CGFloat )fontName{

#warning  主题可以改变字体  客户可以改变字体大小
    return [UIFont systemFontOfSize:fontName];

}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:KThemeChangeNotification object:nil] ;
}
@end
