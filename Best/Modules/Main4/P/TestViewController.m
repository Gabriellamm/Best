//
//  TestViewController.m
//  Best
//
//  Created by Gabriella on 2017/11/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "TestViewController.h"
#import "TestNextViewController.h"
#import "TestV.h"
#import "HttpPayUtils.h"
#import "TestCell.h"

#import "NSObject+CDD.h"
#import "TestBusinessObject.h"
#import "TextDataHandler.h"

#import "TestModel.h"
#import "TestV.h"

@interface TestViewController ()<blueBtnDelegate>
{
NSNumber *myNumber,*floatNumber,*intNumber,*number1;
    UITableView *functionTV ;
}

@property (nonatomic,strong) NSArray              *dataArr;
@property (nonatomic,strong) TestV                *testV;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =  @"测试";

    //------------- 1 -------------
//    TestV * testV = [[TestV alloc]initWithFrame:self.view.bounds];
//    testV.backgroundColor = [UIColor brownColor];
//    testV.blueDelegate = self;
//    self.view  = testV;


    [self initContext];

    self.testV = [[TestV alloc]initWithFrame:self.view.bounds];
    [self.testV buildView];
    _testV.context = self.context;
    self.view  = self.testV;
    

}



-(void)initContext{

    TextDataHandler *dataHandler = [TextDataHandler new];
    TestModel *model = [TestModel new];
    model.Name = @"内存问题";
    [dataHandler insertNewModel:model];
    
    TestBusinessObject *businessO = [TestBusinessObject new];
    businessO.baseController = self;
    self.context = [[CDDContext alloc]initWithDataHandler:dataHandler withBusinessObject:businessO];

    // 获取数据交给datahandler



}
#pragma mark ************* function

-(void)blueBtnAction:(UIButton *)sender{

    // 支付 mm 支持c c++
    [[HttpPayUtils sharedHttpPayUtils] payWithName:@"Dream" price:@"1"];

//    TestNextViewController *next = [[TestNextViewController alloc]init];




    /*
     相同点 ：都能跳转
     不同点 ：
       1.pushViewController navigationController 自带 back 原来的vC还在
       2. presentViewController 任何VC  替换成自己next
     一个利用push, 一个利用present进行跳转
     3.返回时,一个利用pop 一个利用dismiss
     4.push 能乱跳到前面的任何一页.而 present却并没有这项功能.
     

     
     */
//    [self.navigationController pushViewController:next animated:YES];

//    [self presentViewController:next animated:YES completion:^{
//        NSLog( @"我是prentVC");
//    }];

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
