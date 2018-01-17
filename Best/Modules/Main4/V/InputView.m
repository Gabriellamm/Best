//
//  InputView.m
//  Best
//
//  Created by Gabriella on 2017/12/6.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

#import "InputView.h"
#import "CDDContext.h"
#include "TestBusinessObjectProtocol.h"
@interface InputView()

@property (nonatomic,strong) UIButton          *sendBtn;
@property (nonatomic,strong) UITextField       *textF;
@end

@implementation InputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self initView];
    }
    return self;
}


-(void)initView{

    self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sendBtn addTarget:self action:@selector(sendAcion:) forControlEvents:UIControlEventTouchUpInside];
    [self.sendBtn setTitle:@"Send" forState:UIControlStateNormal];
    [self addSubview:self.sendBtn];
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(80, 40));
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-4);
    }];

    self.textF = [UITextField new];
    self.textF.font = [UIFont systemFontOfSize:Font16];
    [self addSubview:self.textF];
    [self.textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(4);
        make.right.mas_equalTo(self.sendBtn.left).offset(-4);
    }];

}

-(void)sendAcion:(UIButton *)sender{


    NSString * text  = self.textF.text;
    if ([self.context.businessObject respondsToSelector:@selector(sendTextMessage:)]) {

        id<TestBusinessObjectProtocol> po = (id<TestBusinessObjectProtocol> )self.context.businessObject;
        [po sendTextMessage:text];

        self.textF.text = nil;
    }
}
@end
