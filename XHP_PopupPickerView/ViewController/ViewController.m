//
//  ViewController.m
//  XHP_PopupPickerView
//
//  Created by xiaohaiping on 16/8/9.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = -1;
    
    [self.view addSubview:self.testBtn];
    CGFloat width = 80.0f;
    CGFloat height = 40.0f;
    CGFloat x = self.view.frame.size.width * 0.5 - width * 0.5;
    CGFloat y = self.view.frame.size.height * 0.5 - height * 0.5;
    [_testBtn setFrame:CGRectMake(x, y, width, height)];
    
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 *  Getter and Setter
 *
 */
-(NSArray *)menuAry
{
    if (_menuAry == nil) {
        _menuAry = @[[CustomMenuModel imageName:@"nav_tweet_all" title:@"广场"],
                     [CustomMenuModel imageName:@"nav_tweet_friend" title:@"好友圈"],
                     [CustomMenuModel imageName:@"nav_tweet_hot" title:@"热门"],
                     [CustomMenuModel imageName:@"nav_tweet_mine" title:@"我的"]];
    }
    return _menuAry;
}


-(TestButton *)testBtn
{
    if (_testBtn == nil) {
        _testBtn = [[TestButton alloc]init];
        [_testBtn addTarget:self action:@selector(testButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testBtn;
}

/**
 *  按钮点击事件
 *
 */
-(void)testButtonEvent:(TestButton *)sender
{
    
    sender.selected = !sender.selected;
    __weak typeof(self)weakSelf = self;
    //使用自定义类型
    [PopupPickerControl setCellClass:[CustomMenuCell class]];
    [PopupPickerControl showWithTitle:@"选择工作类型"
                        WithTitles:self.menuAry
                      defaultIndex:_index
                     selectedBlock:^(id title, NSInteger index) {
                         [weakSelf changeTitle:title toIndex:index];
                     }];

}

/**
 *  改变按钮的标题
 *
 *  @param title
 *  @param index
 */
- (void)changeTitle:(CustomMenuModel *)title toIndex:(NSInteger)index
{
    if (index >= 0 && index < self.menuAry.count) {
        _index = index;
        [_testBtn setTitle:title.title forState:UIControlStateNormal];
    }
    _testBtn.selected = FALSE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
