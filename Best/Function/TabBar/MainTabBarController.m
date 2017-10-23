//
//  MainTabBarController.m
//  Best
//
//  Created by Gabriella on 2017/9/29.
//  Copyright © 2017年 Gabriella. All rights reserved.
/**
 
 自定义   更换肤色 
 */

#import "MainTabBarController.h"
#import "Tabbar.h"
#import "FindVC.h"
#import "MessageVC.h"
#import "MeVC.h"

#import "RootNavigationVC.h"


@interface MainTabBarController ()<TabBarDelegate>
@property (nonatomic,strong)NSMutableArray *VCS; // tabbar root VC
@property (nonatomic,strong)TabBar *tab;
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 一、
    [self setTabbar];

    // 三、
    [self setupAllChildVC];


}

//  当tabbar frame 改变时就会调用
-(void)viewDidLayoutSubviews{

    // 二、
    [self removeOriginControls];

}
#pragma mark ************* setTabbar
-(void)setTabbar{

        _tab = [[TabBar alloc]initWithFrame:self.tabBar.bounds ];

        _tab.badgeTitleFont = ThemeFont(11.0f);
        _tab.itemTitleFont = ThemeFont(10.0f);
        _tab.itemImageRatio         = 0.7;
        self.tab.itemTitleColor         = KBlackColor;
        self.tab.selectedItemTitleColor = CNavBgColor2;
        _tab.delegate = self;

        [self.tabBar addSubview:_tab];
}

#pragma mark ************* 添加子控制器
-(void)setupAllChildVC{
    _VCS = [NSMutableArray new];

    //4.创建选项按钮

    NSArray *titles = @[@"发现",@"信息",@"我的"];
    NSArray *imgNames = @[
                          @"home_tab_icon_1.png",
                          @"home_tab_icon_2.png",
                          @"home_tab_icon_3.png"
                          ];
    NSArray *selectimageNames = @[];

    FindVC * findVC = [[FindVC alloc]init];
    MessageVC * messVC = [[MessageVC alloc]init];
    MeVC *meVC = [[MeVC alloc]init];
    
    NSArray *vcs = @[findVC,messVC,meVC];

    for (int i = 0; i<vcs.count; i++) {
            [self setupChildVC:vcs[i] withTitle:titles[i] withImageName:imgNames[i] withSelectName:nil];
        UIViewController *VC = vcs[i];

        [self.tab addTabBarItem:VC.tabBarItem];

    }



    self.viewControllers = _VCS;


}

#pragma mark ************* 提取系统自带的tabbar 子控制器删除
-(void)removeOriginControls{

    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }];
}

-(void)setupChildVC:(UIViewController *)VC withTitle:(NSString *)title withImageName:(NSString *)imageName withSelectName:(NSString *)selectImageName{

    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    if (selectImageName) {
        VC.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    }

    RootNavigationVC *rootNVC = [[RootNavigationVC alloc]initWithRootViewController:VC];
    [_VCS addObject:rootNVC];


}


#pragma mark - TabBarDelegate Method

- (void)tabBar:(TabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to {

    self.selectedIndex = to;
}


-(void)addChildViewController:(UIViewController *)childController{


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
