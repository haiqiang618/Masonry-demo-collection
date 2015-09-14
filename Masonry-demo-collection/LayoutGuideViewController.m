//
//  LayoutGuideViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "LayoutGuideViewController.h"

// 注释掉这个宏定义，就直接使用length值做约束，否则的话，使用新的mas_topLayoutGuide和mas_bottomLayoutGuide
#define NEW_FEATURE

@interface LayoutGuideViewController ()

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIView *bottomView;

@end

@implementation LayoutGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    NSLog(@"[viewDidLoad] top: %g", self.topLayoutGuide.length);

}

- (void)initViews
{
    WS(weakSelf)
    
    _topView = [UIView new];
    _topView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_topView];
    [weakSelf.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.and.right.equalTo(weakSelf.view);
        
#ifdef NEW_FEATURE
        make.top.equalTo(weakSelf.mas_topLayoutGuide);
#endif
        
    }];
    
    _bottomView = [UIView new];
    _bottomView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_bottomView];
    [weakSelf.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.and.right.equalTo(weakSelf.view);
        
#ifdef NEW_FEATURE
        make.bottom.equalTo(weakSelf.mas_bottomLayoutGuide);
#endif
    }];
    
    UIButton *navButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [navButton setTitle:@"Show or Hide NavBar" forState:UIControlStateNormal];
    navButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:navButton];
    [navButton addTarget:self action:@selector(showOrHideTopBar:) forControlEvents:UIControlEventTouchUpInside];
    
    [navButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-10);
        make.top.equalTo(weakSelf.topView).with.offset(50);
        make.height.mas_equalTo(@40.f);
    }];
    
    UIButton *toolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [toolButton setTitle:@"Show or Hide NavBar" forState:UIControlStateNormal];
    toolButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:toolButton];
    [toolButton addTarget:self action:@selector(showOrHideBottomBar:) forControlEvents:UIControlEventTouchUpInside];
    
    [toolButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-10);
        make.top.equalTo(weakSelf.bottomView.mas_bottom).with.offset(-100);
        make.height.mas_equalTo(@40.f);
    }];
}

- (void)showOrHideTopBar:(UIButton *)btn
{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:NO];
    // 隐藏、显示了NavigationBar以后，要手动触发updateViewConstraints，更新约束
    [self updateViewConstraints];
}

- (void)showOrHideBottomBar:(UIButton *)btn
{
    [self.navigationController setToolbarHidden:!self.navigationController.toolbarHidden animated:NO];
    // 手动触发updateViewConstraints
    [self updateViewConstraints];
}

- (void)updateViewConstraints {
#ifndef NEW_FEATURE
    // 根据新的length值更新约束
    WS(weakSelf)
    [weakSelf.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        // 直接利用其length属性，避免iOS、SDK版本升级后topLayoutGuide不再是UIView
        make.top.equalTo(weakSelf.view.mas_top).with.offset(weakSelf.topLayoutGuide.length);
    }];
    
    // 根据新的length值更新约束
    weakSelf.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        // 直接利用其length属性，避免iOS、SDK版本升级后topLayoutGuide不再是UIView
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-(weakSelf.bottomLayoutGuide.length));
    }];
#endif
    
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
