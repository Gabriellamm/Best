

#import "TestV.h"
#import <UIKit/UIKit.h>
#import "TestCell.h"
#import "InputView.h"

#import "CDDContext.h"
#import "CDDMutableArray.h"
#import "TestHandlerProtocol.h"
#import "TextDataHandler.h"
#import "TestModel.h"


@interface TestV ()<UITableViewDataSource,UITableViewDelegate,CDDMutableArrayDelegate>

@property (nonatomic,weak)void(^testBlock)();
@property (nonatomic,strong) UITableView          *functionTV;
@property (nonatomic,strong) InputView            *inputV;

@property (nonatomic,strong) NSArray              *models;
@end
@implementation TestV


-(void)buildView{

    //
    self.backgroundColor = [UIColor whiteColor];
    _functionTV =[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    _functionTV.delegate = self;
    _functionTV.dataSource = self;
    _functionTV.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    [_functionTV registerClass:[TestCell class] forCellReuseIdentifier:@"TestCell"];
    [self addSubview:_functionTV];


    
//    //  输入对话框
//    self.inputV = [[InputView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, kCDDDemoViewInputViewHeight)];
//    [self addSubview:self.inputV];

     [[(id<TestHandlerProtocol>)self.context.dataHandler getDatas] addArrayObserver:self];

    [_functionTV reloadData];

}

- (void)drawRect:(CGRect)rect {

//    self.backgroundColor = [UIColor whiteColor];
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//
//    button.frame = CGRectMake(0, 0, 50, 50);
//    button.center = self.center;
//    [button setTitle:@"check" forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor yellowColor];
//    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
//
//    [self addSubview:button];
//
//    //    int value = 10;
//    void(^ __weak blockC)()=^{
//
//        //        NSLog(@"value = %d",value);
//    };
//
//    NSLog(@"blockC = %@",blockC);
//    _testBlock = blockC;

}


-(void)btnAction:(UIButton *)sender{
//
//    _testBlock();
//    NSLog(@"testblock = %@",_testBlock);
//



        if ([_blueDelegate respondsToSelector:@selector(blueBtnAction:)]) { // 如果协议响应了sendValue:方法
            [_blueDelegate blueBtnAction:sender]; // 通知执行协议方法
        }
        
}


#pragma mark -----------------------------------tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



    _models = [(id<TestHandlerProtocol>)self.context.dataHandler getDatas] ;

    return _models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (!cell) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestCell"];
    }

    TestModel  *model = _models[indexPath.row];
    cell.textLabel.text = model.Name;
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *selectArr = @[@"TestNextViewController",@"AnimationVC"];
UIViewController *VC = self.context.businessObject.baseController;
//    UIViewController *VC = [self presentingViewController];
    [XiaJumpManager navigation:VC pushToSpecifiedVC:selectArr[indexPath.row]];
}
- (void)didAddObject:(id)anObject withinArr:(CDDMutableArray*)arr{
    if (arr == [((id<TestHandlerProtocol>)self.context.dataHandler) getDatas] && anObject) {
        [self.functionTV reloadData];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self scrollingToBottom:true];
        });

    }
}
- (void)didRemoveObject:(id)anObject withinArr:(CDDMutableArray*)arr{

    if (arr == [((id<TestHandlerProtocol>)self.context.dataHandler) getDatas] && anObject) {
        [self.functionTV reloadData];
        [self scrollingToBottom:true];
    }
}

- (void)scrollingToBottom:(BOOL)animated
{
    int cellCount = (int)[_functionTV.dataSource tableView:_functionTV numberOfRowsInSection:0];
    if (cellCount == 0) {
        return;
    }

    CGRect frame = _functionTV.frame;
    CGFloat originY = 0;
    CGFloat contentHeight = _functionTV.contentSize.height + originY;
    if (contentHeight > frame.size.height) {
        CGPoint offset = CGPointMake(0, _functionTV.contentSize.height - _functionTV.frame.size.height);
        [_functionTV setContentOffset:offset animated:animated];
    }
}






- (void)dealloc
{
    NSLog(@"TestV released");
}
@end
