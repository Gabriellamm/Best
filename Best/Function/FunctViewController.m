//
//  FunctViewController.m
//  Best
//
//  Created by Gabriella on 2017/12/28.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "FunctViewController.h"

@interface FunctViewController ()<UICollectionViewDataSourcePrefetching>

@end

@implementation FunctViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

    -(void)iamgeStrehable{

        UIImage *image =[UIImage imageNamed:@""];
//        UIImage *stretchImage = [image stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>];
        UITextField *teF = [UITextField new];
//        teF.contentVerticalAlignment
        teF.enablesReturnKeyAutomatically  =YES;// 输入框有值才能点击键盘
//self.navigationController setNavigationBarHidden:<#(BOOL)#> animated:<#(BOOL)#>

//        2、 获取一个随机数范围在：[500,1000），包括500，不包括1000

                       int y = (arc4random() % 501) + 500;




    }
                       //                       3、获取一个随机整数，范围在[from,to），包括from，不包括to

                                      -(int)getRandomNumber:(int)from to:(int)to

                                      {

                                          return (int)(from + (arc4random() % (to - from + 1))); //+1,result is [from to]; else is [from, to)!!!!!!!

                                      }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// indexPaths are ordered ascending by geometric distance from the collection view
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{


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
