//
//  ButtonVC.m
//  Best
//
//  Created by Gab on 2018/1/17.
//  Copyright © 2018年 Gabriella. All rights reserved.
//

#import "ButtonVC.h"

@interface ButtonVC ()
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@end

@implementation ButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(KScreenWidth, KScreenWidth/15*3, 100, 30);
    [self.rightBtn setTitle:@"Buy" forState:UIControlStateNormal];
    [self.rightBtn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.rightBtn];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startAnimationAction];
    });

}
-(void)startAnimationAction{
   
    // 位置改变
 __block  POPBasicAnimation *RightbasiA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    RightbasiA.toValue = @((KScreenWidth - CGRectGetHeight(self.rightBtn.frame))/2);
    [self.rightBtn.layer pop_addAnimation:RightbasiA forKey:@"layerPositionAnimation"];
   
    // 右边抖动
    POPSpringAnimation *rightSpri = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
  
    
    rightSpri.velocity = [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)];
    rightSpri.toValue = [NSValue valueWithCGPoint:CGPointMake(1,1)];
    rightSpri.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.3)];
    rightSpri.springBounciness = 20.f;
    [self.rightBtn.layer pop_addAnimation:rightSpri forKey:@"layerScaleAnimation"];
    
    [rightSpri setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                self.leftBtn.frame = CGRectMake(-100, KScreenWidth/15*5, 100, 30);
                [self.leftBtn setTitle:@"sell" forState:UIControlStateNormal];
                [self.leftBtn setBackgroundColor:[UIColor blueColor]];
                [self.view addSubview:self.leftBtn];
            
            POPBasicAnimation *leftAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
            leftAnimation.toValue = @((KScreenWidth - CGRectGetHeight(self.leftBtn.frame))/2);
           
            [self.leftBtn pop_addAnimation:leftAnimation forKey:@"leftAnimation"];
            
            POPSpringAnimation *leftSpri = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
            leftSpri.velocity = [NSValue valueWithCGPoint:CGPointMake(0.5, 0.5)];
            leftSpri.toValue = [NSValue valueWithCGPoint:CGPointMake(1,1)];
            leftSpri.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.3)];
            leftSpri.springBounciness = 20.f;
            [self.leftBtn.layer pop_addAnimation:leftSpri forKey:@"leftSpri"];
        });
    }];
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
