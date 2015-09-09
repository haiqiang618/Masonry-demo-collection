//
//  IntermediateViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/8.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "IntermediateViewController.h"

@interface IntermediateViewController ()

@end

@implementation IntermediateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}

- (void)configureUI
{
    //申明区域，displayView是显示区域, keyboardView是键盘区域
    UIView *displayView = [UIView new];
    displayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:displayView];
    
    UIView *keyboardView = [UIView new];
    [self.view addSubview:keyboardView];
    
    //先按1:3分割displayView(显示结果区域)和keyboardView(键盘区域)
    WS(weakSelf)
    [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top);
        make.left.and.right.equalTo(weakSelf.view);
        make.height.equalTo(keyboardView).multipliedBy(0.3f);
    }];
    
    [keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(displayView.mas_bottom);
        make.bottom.equalTo(weakSelf.view.mas_bottom);
        make.left.and.right.equalTo(weakSelf.view);
    }];
    
    //设置显示位置的数字为0
    UILabel *displayNumLabel = [UILabel new];
    [displayView addSubview:displayNumLabel];
    displayNumLabel.text = @"0";
    displayNumLabel.font = [UIFont fontWithName:@"HeiTi SC" size:70];
    displayNumLabel.textColor = [UIColor whiteColor];
    displayNumLabel.textAlignment = NSTextAlignmentRight;
    [displayNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(displayView).with.offset(-10);
        make.bottom.equalTo(displayView).with.offset(-10);
    }];
    
    //定义键盘键名称，？号代表合并的单元格
    NSArray *keys = @[@"AC",@"+/-",@"%",@"÷"
                      ,@"7",@"8",@"9",@"x"
                      ,@"4",@"5",@"6",@"-"
                      ,@"1",@"2",@"3",@"+"
                      ,@"0",@"?",@".",@"="];
    int indexOfKeys = 0;
    for (NSString *key in keys) {
        //循环所有键
        indexOfKeys++;
        int rowNum = indexOfKeys%4 == 0 ? indexOfKeys/4 : (indexOfKeys/4+1);
        int colNum = indexOfKeys%4 == 0 ? 4 : (indexOfKeys%4);
        
        //键样式
        UIButton *keyView = [UIButton buttonWithType:UIButtonTypeCustom];
        [keyboardView addSubview:keyView];
        [keyView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [keyView setTitle:key forState:UIControlStateNormal];
        keyView.layer.borderWidth = 1.0;
        keyView.layer.borderColor = [UIColor blackColor].CGColor;
        [keyView.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30]];
        //键约束
        [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
           //处理0 合并单元格
            if ([key isEqualToString:@"0"] || [key isEqualToString:@"?"]) {
                if ([key isEqualToString:@"0"]) {
                    [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.height.equalTo(keyboardView.mas_height).with.multipliedBy(0.2f);
                        make.width.equalTo(keyboardView.mas_width).with.multipliedBy(0.5f);
                        make.left.equalTo(keyboardView.mas_left);
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(0.9f);
                    }];
                }
                if ([key isEqualToString:@"?"]) {
                    [keyView removeFromSuperview];
                }
            } else {
                make.width.equalTo(keyboardView.mas_width).with.multipliedBy(0.25f);
                make.height.equalTo(keyboardView.mas_height).with.multipliedBy(0.2f);
                
                //按照行和列添加约束，这里添加行约束
                switch (rowNum) {
                    case 1:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(0.1f);
                        keyView.backgroundColor = [UIColor colorWithRed:205 green:205 blue:205 alpha:1];
                    }
                        break;
                    case 2:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(0.3f);
                    }
                        break;
                    case 3:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.5f);
                    }
                        break;
                    case 4:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.7f);
                    }
                        break;
                    case 5:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.9f);                    }
                        break;
                    default:
                        break;
                }
//
                //按照行和列添加约束，这里添加列约束
                switch (colNum) {
                    case 1:
                    {
                        make.left.equalTo(keyboardView.mas_left);
                    }
                        break;
                    case 2:
                    {
                        make.right.equalTo(keyboardView.mas_centerX);
                    }
                        break;
                    case 3:
                    {
                        make.left.equalTo(keyboardView.mas_centerX);
                    }
                        break;
                    case 4:
                    {
                        make.right.equalTo(keyboardView.mas_right);
                        [keyView setBackgroundColor:[UIColor colorWithRed:243 green:127 blue:38 alpha:1]];
                    }
                        break;
                    default:
                        break;
                }
            }
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
