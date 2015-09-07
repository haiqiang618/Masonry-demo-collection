//
//  PrimaryViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/7.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "PrimaryViewController.h"

@interface PrimaryViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation PrimaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}

- (void)configureUI
{
    WS(weakSelf);
    self.navigationController.navigationBar.translucent = NO;
    
    self.scrollView = [UIScrollView new];
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsZero);
    }];
    
    UIView *containerView = [UIView new];
    [self.scrollView addSubview:containerView];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.scrollView);
        make.width.mas_equalTo(weakSelf.scrollView);
    }];
    
  
    /**
     *  居中显示一个view
     */
    
    UILabel *label = [UILabel new];
    [containerView addSubview:label];
    
    label.text = @"1.居中显示view";
    [label sizeToFit];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor greenColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [containerView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UILabel *label2 = [UILabel new];
    label2.numberOfLines = 0;
    [containerView addSubview:label2];
    
    label2.text = @"2.让一个view略小于其superview（边距为10）";
    [label2 sizeToFit];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];

    /**
     *  让一个view略小于其superview（边距为10）
     */
    UIView *view2 = [UIView new];
    view2.backgroundColor = [UIColor redColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [containerView addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
   
    UIView *view2_1 = [UIView new];
    view2_1.backgroundColor = [UIColor orangeColor];
    [view2 addSubview:view2_1];

    [view2_1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        1
        make.edges.equalTo(view2).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        2
//        make.top.equalTo(view).with.offset(10);
//        make.left.equalTo(view).with.offset(10);
//        make.bottom.equalTo(view).with.offset(-10);
//        make.right.equalTo(view).with.offset(-10);
    }];
    
    
    /**
     *  让两个高度为150的view垂直居中且等宽间距排列，间隔为10
     */
    UILabel *label3 = [UILabel new];
    label3.numberOfLines = 0;
    [containerView addSubview:label3];
    
    label3.text = @"3.让两个高度为150的view垂直居中且等宽间距排列，间隔为10";
    [label3 sizeToFit];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];
    
    UIView *view3 = [UIView new];
    view3.backgroundColor = [UIColor redColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [containerView addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label3.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    int padding1 = 10;

    UIView *view3_1 = [UIView new];
    view3_1.backgroundColor = [UIColor orangeColor];
    [view3 addSubview:view3_1];

    UIView *view3_2 = [UIView new];
    view3_2.backgroundColor = [UIColor orangeColor];
    [view3 addSubview:view3_2];

    [view3_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view3.mas_centerY);
        make.left.equalTo(view3.mas_left).with.offset(padding1);
        make.right.equalTo(view3_2.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3_2);
    }];

    [view3_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view3.mas_centerY);
        make.left.equalTo(view3_1.mas_right).with.offset(padding1);
        make.right.equalTo(view3.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3_1);
    }];
    
    /**
     *  在UIScrollView顺序排列一些view并自动计算contentSize
     */
    UILabel *label4 = [UILabel new];
    label4.numberOfLines = 0;
    [containerView addSubview:label4];
    
    label4.text = @"4.在UIScrollView顺序排列一些view并自动计算contentSize";
    [label4 sizeToFit];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view3.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];
    
    UIView *view4 = [UIView new];
    view4.backgroundColor = [UIColor redColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [containerView addSubview:view4];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label4.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
        UIScrollView *scrollview = [UIScrollView new];
        scrollview.backgroundColor = [UIColor whiteColor];
        [view4 addSubview:scrollview];
    
        [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view4).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    
        UIView *containerView_4 = [UIView new];
        [scrollview addSubview:containerView_4];
        [containerView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollview);
            make.width.equalTo(scrollview);
        }];

        int count = 10;
        UIView *lastView = nil;
        for (int i=0; i<count; i++) {
            UIView *subV = [UIView new];
            [containerView_4 addSubview:subV];
            subV.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                              saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                              brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                                   alpha:1];
            [subV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.right.equalTo(containerView_4);
                make.height.mas_equalTo(@(20*i));
                if (lastView) {
                    make.top.mas_equalTo(lastView.mas_bottom);
                } else {
                    make.top.mas_equalTo(containerView_4.mas_top);
                }
            }];
            lastView = subV;
        }
    //  这里的关键就在于container这个view起到了一个中间层的作用 能够自动的计算uiscrollView的contentSize
        [containerView_4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lastView.mas_bottom);
        }];
    
  
    UILabel *label5 = [UILabel new];
    label5.numberOfLines = 0;
    [containerView addSubview:label5];
    
    label5.text = @"5.横向或者纵向等间隙排列一组view";
    [label5 sizeToFit];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view4.mas_bottom).with.offset(10);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
    }];
    
    UIView *view5 = [UIView new];
    view5.backgroundColor = [UIColor redColor];
    // 在做autolayout之前，一定要先将view添加到superview上，否则会报错
    [containerView addSubview:view5];
    
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];

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

    [view5 addSubview:view51];
    [view5 addSubview:view52];
    [view5 addSubview:view53];
    [view5 addSubview:view54];
    [view5 addSubview:view55];
//
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
//    //
    [view5 distributeSpacingHorizontallyWith:@[view51, view52, view53]];
    [view5 distributeSpacingVerticallyWith:@[view51,view54,view55]];
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view5.mas_bottom).with.offset(20);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
