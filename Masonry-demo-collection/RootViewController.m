//
//  ViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/7.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}

- (void)configureUI
{
    WS(weakSelf);
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor greenColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
}



/**
 *  http://www.cocoachina.com/ios/20141219/10702.html
 */

//首先在Masonry中能够添加autolayout约束有三个函数
//- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
//- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
//- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
/*
 mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
 mas_updateConstraints 针对上面的情况 会更新在block中出现的约束 不会导致出现两个相同约束的情况
 mas_remakeConstraints 则会清除之前的所有约束 仅保留最新的约束
 三种函数善加利用 就可以应对各种情况了
 */

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 3;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 2;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
