//
//  AnimationVC.m
//  Best
//
//  Created by Gab on 2018/1/17.
//  Copyright © 2018年 Gabriella. All rights reserved.
//

#import "AnimationVC.h"
#import "AnimitionCell.h"
static NSString *const AnimiCellIdentifier = @"AnimiCellIdentifier";
@interface AnimationVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSArray *tableVItems;
@property (nonatomic, strong)UITableView *animitTableV;
@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self cofigureTableView];
}

-(void)cofigureTableView{
  
    self.tableVItems = @[
                         @[@"button animition",@"ButtonVC"]
                         ];
 
    [self.view addSubview:self.animitTableV];
}
#pragma mark -----------------------------------tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  [self tableVItems].count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AnimitionCell *cell = [tableView dequeueReusableCellWithIdentifier:AnimiCellIdentifier];
    NSArray *indexTitle =self.tableVItems[indexPath.row] ;
    cell.textLabel.text = (NSString *)[indexTitle firstObject];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  KScreenHeight/15;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *indexTitle =self.tableVItems[indexPath.row] ;
    NSString *ClassStr = (NSString *)[indexTitle lastObject];
    [XiaJumpManager navigation:self pushToSpecifiedVC:ClassStr];
}
#pragma mark -----------------------------------懒加载
-(UITableView *)animitTableV{
    if (!_animitTableV) {
       _animitTableV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_animitTableV registerClass: NSClassFromString(@"AnimitionCell") forCellReuseIdentifier:AnimiCellIdentifier];
        _animitTableV.dataSource = self;
        _animitTableV.delegate   = self;
    }
    return _animitTableV;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    DLog(@"AnimationVC.h  didReceiveMemoryWarning")
    // Dispose of any resources that can be recreated.
}

@end
