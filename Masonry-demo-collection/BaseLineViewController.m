//
//  BaseLineViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "BaseLineViewController.h"
#import "ItemView.h"

@interface BaseLineViewController ()

@end

@implementation BaseLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews
{
    // 初始化图片资源
    NSArray *images = @[[UIImage imageNamed:@"dog_small"], [UIImage imageNamed:@"dog_middle"], [UIImage imageNamed:@"dog_big"]];
    
    // 创建3个item
    UIView *item1 = [ItemView newItemWithImage:images[0] text:@"Auto layout is a system"];
    UIView *item2 = [ItemView newItemWithImage:images[1] text:@"Auto Layout is a system that lets you lay out"];
    UIView *item3 = [ItemView newItemWithImage:images[2] text:@"Auto Layout is a system that lets you lay out your app’s user interface"];
    [self.view addSubview:item1];
    [self.view addSubview:item2];
    [self.view addSubview:item3];
    
    [item1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(8);
        make.top.mas_equalTo(self.view.mas_top).with.offset(200);
    }];
    
    // 跟第一个item的baseline对其
    [item2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item1.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }];
    
    // 跟第一个item的baseline对其
    [item3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item2.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
