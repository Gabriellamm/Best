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
#import "PersonalCenterChildBaseVC.h"
#import "ChildVCOne.h"
#import "ChildVCTwo.h"
#import "ChildVCThree.h"
#import "JMTabBarController.h"

@interface FindVC ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@property (nonatomic,strong) id<AbstractMapFactory>          absMapFactory;
@property (nonatomic,strong) id<AbstractMapView>             absMapView;
@property (nonatomic, strong) JMTabBarController *tabBarVc;

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        // 下、右不需要写负号，insets方法中已经为我们做了取反的操作了。
////        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(100, 100, 100, 100));
//        make.center.equalTo(self.view);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(200);
//
//
//
//    }];

//    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
//        make.bottom.equalTo(self.blueView.mas_top).offset(-padding);
//    }];

//    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(50, 50));
//    }];

}
-(void)initView{

    [self initPageView];
}


-(void)initPageView{
    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    CGFloat pageTitleViewY = 0;
    if (statusHeight == 20.0) {
        pageTitleViewY = 64;
    } else {
        pageTitleViewY = 88;
    }

    NSArray *titleArr = @[@"精选", @"电影", @"娱乐"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.titleSelectedColor = MainThemeColor;
    /// pageTitleView
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    _pageTitleView.isShowIndicator = NO;
    _pageTitleView.isOpenTitleTextZoom = YES;

    ChildVCOne *oneVC = [[ChildVCOne alloc] init];
    ChildVCTwo *twoVC = [[ChildVCTwo alloc] init];
    ChildVCThree *threeVC = [[ChildVCThree alloc] init];

    NSArray *childArr = @[oneVC, twoVC, threeVC];
    /// pageContentView
    CGFloat contentViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
}
#pragma mark ------------------------ SGPageTitleViewDelegate, SGPageContentViewDelegate
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
#pragma mark ------------------------ 功能
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
    DLog(@" FindVC  didReceiveMemoryWarning");
}
-(void)dealloc{
DLog(@" FindVC  dealloc");
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
