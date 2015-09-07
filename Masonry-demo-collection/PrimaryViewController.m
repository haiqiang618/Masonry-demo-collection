//
//  PrimaryViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/7.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "PrimaryViewController.h"

@interface PrimaryViewController ()

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}

- (void)configureUI
{
    WS(weakSelf);
    
    
    /**
     *  居中显示一个view
     */
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor greenColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    /**
     *  让一个view略小于其superview（边距为10）
     */
    
    //    UIView *view2 = [UIView new];
    //    view2.backgroundColor = [UIColor redColor];
    //    [view addSubview:view2];
    //
    //    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        1
    ////        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    ////        2
    ////        make.top.equalTo(view).with.offset(10);
    ////        make.left.equalTo(view).with.offset(10);
    ////        make.bottom.equalTo(view).with.offset(-10);
    ////        make.right.equalTo(view).with.offset(-10);
    //    }];
    
    
    /**
     *  让两个高度为150的view垂直居中且等宽间距排列，间隔为10
     */
    
    //    int padding1 = 10;
    //
    //    UIView *view3 = [UIView new];
    //    view3.backgroundColor = [UIColor orangeColor];
    //    [view addSubview:view3];
    //
    //    UIView *view4 = [UIView new];
    //    view4.backgroundColor = [UIColor orangeColor];
    //    [view addSubview:view4];
    //
    //    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(view.mas_centerY);
    //        make.left.equalTo(view.mas_left).with.offset(padding1);
    //        make.right.equalTo(view4.mas_left).with.offset(-padding1);
    //        make.height.mas_equalTo(@150);
    //        make.width.equalTo(view4);
    //    }];
    //
    //    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(view.mas_centerY);
    //        make.left.equalTo(view3.mas_right).with.offset(padding1);
    //        make.right.equalTo(view.mas_right).with.offset(-padding1);
    //        make.height.mas_equalTo(@150);
    //        make.width.equalTo(view3);
    //    }];
    
    
    /**
     *  在UIScrollView顺序排列一些view并自动计算contentSize
     */
    
    //    UIScrollView *scrollview = [UIScrollView new];
    //    scrollview.backgroundColor = [UIColor whiteColor];
    //    [view addSubview:scrollview];
    //
    //    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    //    }];
    //
    //    UIView *containerView = [UIView new];
    //    [scrollview addSubview:containerView];
    //    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(scrollview);
    //        make.width.equalTo(scrollview);
    //    }];
    //
    //    int count = 10;
    //    UIView *lastView = nil;
    //    for (int i=0; i<count; i++) {
    //        UIView *subV = [UIView new];
    //        [containerView addSubview:subV];
    //        subV.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
    //                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
    //                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
    //                                               alpha:1];
    //        [subV mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.left.and.right.equalTo(containerView);
    //            make.height.mas_equalTo(@(20*i));
    //            if (lastView) {
    //                make.top.mas_equalTo(lastView.mas_bottom);
    //            } else {
    //                make.top.mas_equalTo(containerView.mas_top);
    //            }
    //        }];
    //        lastView = subV;
    //    }
    ////  这里的关键就在于container这个view起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
    //    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.bottom.equalTo(lastView.mas_bottom);
    //    }];
    
    UIView *view51 = [UIView new];
    UIView *view52 = [UIView new];
    UIView *view53 = [UIView new];
    UIView *view54 = [UIView new];
    UIView *view55 = [UIView new];
    
    view51.backgroundColor = [UIColor purpleColor];
    view52.backgroundColor = [UIColor purpleColor];
    view53.backgroundColor = [UIColor purpleColor];
    view54.backgroundColor = [UIColor purpleColor];
    view55.backgroundColor = [UIColor purpleColor];
    
    [view addSubview:view51];
    [view addSubview:view52];
    [view addSubview:view53];
    [view addSubview:view54];
    [view addSubview:view55];
    
    [view51 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[view52, view53]);
        make.centerX.equalTo(@[view54, view55]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [view52 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [view53 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [view54 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [view55 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    //
    [view distributeSpacingHorizontallyWith:@[view51, view52, view53]];
    [view distributeSpacingVerticallyWith:@[view51,view54,view55]];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
