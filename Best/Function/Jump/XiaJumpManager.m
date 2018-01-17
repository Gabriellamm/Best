//
//  XiaJumpManager.m
//  Best
//
//  Created by Gabriella on 2018/1/9.
//  Copyright © 2018年 Gabriella. All rights reserved.
//

#import "XiaJumpManager.h"
#import <objc/runtime.h>
@implementation XiaJumpManager


+(XiaJumpManager *) navigation:(UIViewController *)originalVC pushToSpecifiedVC:(NSString *)ViewControllerString{
    XiaJumpManager *vcg =[[XiaJumpManager alloc]init];
    UIViewController *vc = [[NSClassFromString(ViewControllerString) alloc]init];
    if (vc == nil) {
        NSLog(@"当前目标控制器不存在");
        return nil;
    }
//     UIViewController *originalVC = [[NSClassFromString(originalVCStr) alloc]init];
    if (originalVC == nil) {
        NSLog(@"当前控制器不存在");
        return nil;
    }
    if (originalVC) {
        [originalVC.navigationController pushViewController:vc animated:YES];
    }
    
    return vcg;
}

// nav 参数
+(XiaJumpManager *) navigation:(id)originalVC pushToSpecifiedVC:(UIViewController *)ViewController withParam:(NSDictionary *)param{
    XiaJumpManager *vcg =[[XiaJumpManager alloc]init];
    if (originalVC) {
        [XiaJumpManager object:ViewController setPropertyValues:param];
        UIViewController *vc = (UIViewController *)originalVC;
        [vc.navigationController pushViewController:ViewController animated:YES];
    }

    return vcg;
}

// vc
+(XiaJumpManager *)currentViewController:(id )currentViewController presentToSpecifiedVC:(UIViewController *)ViewController{
    XiaJumpManager *vcg =[[XiaJumpManager alloc]init];
    if (currentViewController) {
        UIViewController *vc = (UIViewController *)currentViewController;
        [vc presentViewController:ViewController animated:YES completion:nil];
    }


    return vcg;
}

// vc 参数

+(XiaJumpManager *)currentViewController:(id)currentViewController presentToSpecifiedVC:(UIViewController *)ViewController withParam:(NSDictionary *)param{
    XiaJumpManager *vcg =[[XiaJumpManager alloc]init];
    if (currentViewController) {

        [XiaJumpManager object:ViewController setPropertyValues:param];
        UIViewController *vc = (UIViewController *)currentViewController;
        [vc presentViewController:ViewController animated:YES completion:nil];
    }


    return vcg;
}


+ (id)object:(id)object setPropertyValues:(NSDictionary *)param {

    if (param && [param isKindOfClass:[NSDictionary class]]) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([object class], &outCount);
        for (i = 0; i < outCount; i++){
            objc_property_t property = properties[i];
            const char *char_f = property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            id propertyValue = [param valueForKey:(NSString *)propertyName];
            if (propertyValue){
                //                //缓存单实例到内存
                [object setValue:propertyValue forKey:propertyName];

            }
        }
        free(properties);
    }
    return object;
}

@end





