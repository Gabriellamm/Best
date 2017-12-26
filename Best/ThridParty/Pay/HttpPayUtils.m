//
//  HttpUtils.m
//  Best
//
//  Created by Gabriella on 2017/11/30.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "HttpPayUtils.h"

@implementation HttpPayUtils
SINGLETON_FOR_CLASS(HttpPayUtils)
//1.向服务器发起预支付
//例如：商品名称、商品价格、商品描述、商品数量等等...
-(void)payWithName:(NSString*)name price:(NSString*)price{


    //第一步：创建请求
    NSURL* url = [[NSURL alloc] initWithString:@"http://192.168.57.1:8080/Dream_20170503_Pay_WxPay_Server/WxPayServlet"];

    //第二步：创建请求参数
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];

    //第三步：绑定参数
    request.HTTPMethod = @"POST";
    NSString* params = [[NSString alloc] initWithFormat:@"name=%@&price=%@",name,price];
    request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];

    //第四步：创建请求回话
    NSURLSession* session = [NSURLSession sharedSession];

    //第五步：创建任务
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //处理服务器返回结果
        if (error != nil) {
            NSLog(@"签名失败!");
        }else{
            NSLog(@"签名成功!");
            //解析json:目的为了调用微信支付
            //将json转成字典
            NSString* result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //打印
            NSLog(@"%@",result);

            NSDictionary* jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            [self pay:jsonDic];
        }
    }];

    //第六步：执行请求
    [task resume];
}



-(void)pay:(NSDictionary*)jsonDic{
    NSDictionary* orderModelDic = [jsonDic objectForKey:@"orderBean"];
    NSString* timeStamp = [NSString stringWithFormat:@"%@",[orderModelDic objectForKey:@"timestamp"]];

    PayReq *request = [[PayReq alloc] init];
    request.partnerId = [orderModelDic objectForKey:@"partnerid"];
    request.prepayId= [orderModelDic objectForKey:@"prepayid"];
    request.package = @"Sign=WXPay";
    request.nonceStr= [orderModelDic objectForKey:@"noncestr"];
    request.timeStamp= [timeStamp intValue];
    request.sign= [orderModelDic objectForKey:@"sign"];

    // 2 .向微信发起请求
    [WXApi sendReq:request];
}

// 3.微信的回掉
-(void)onResp:(BaseResp*)resp{
    //BaseResp：PayResp、分享返回等等....
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        switch(response.errCode){
            case WXSuccess:
                //服务器端查询支付通知或查询API返回的结果再提示成功
                NSLog(@"支付成功");
                break;
            default:
                NSLog(@"支付失败，retcode=%d",resp.errCode);
                break;
        }
    }
}
@end
