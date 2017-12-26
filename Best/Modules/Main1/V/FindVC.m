//
//  FindVC.m
//  Best
//
//  Created by Gabriella on 2017/10/20.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "FindVC.h"
#import "MapEngine.h"
#import "AbstractMapFactory.h"
#import "AbstractMapView.h"

@interface FindVC ()

@property (nonatomic,strong) id<AbstractMapFactory>          absMapFactory;
@property (nonatomic,strong) id<AbstractMapView>             absMapView;
@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title  = @"发现";

    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(showMap:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        // 下、右不需要写负号，insets方法中已经为我们做了取反的操作了。
//        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(100, 100, 100, 100));
        make.center.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);



    }];

//    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
//        make.bottom.equalTo(self.blueView.mas_top).offset(-padding);
//    }];

//    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(50, 50));
//    }];

}


-(void)showMap:(UIButton *)sender{

/** 地图
 1. 初始化地图
 2. mapview
 */

    _absMapFactory = [[MapEngine sharedMapEngine] getMapFactory];
    _absMapView  = [_absMapFactory getMapViewWithFrame:[UIScreen mainScreen].bounds];
 DLog(@"_absMapFactory :%@ _absMapView:%@",_absMapFactory,_absMapView)
    
    [self.view addSubview:[_absMapView getView]];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
