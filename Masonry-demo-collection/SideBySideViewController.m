//
//  SideBySideViewController.m
//  Masonry-demo-collection
//
//  Created by HQRaining on 15/9/13.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "SideBySideViewController.h"

typedef NS_ENUM(NSInteger, stepSelectSide) {
    stepSelectSide_Left,
    stepSelectSide_Right
};

@interface SideBySideViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation SideBySideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];

}

- (void)configureUI
{
    self.navigationController.navigationBar.translucent = NO;
    
    UILabel *describeLabel = [UILabel new];
    describeLabel.text = @"并排两个label，整体靠左边，宽度随内容增长，左边的label“优先级更高”。";
    describeLabel.numberOfLines = 2;
    [self.view addSubview:describeLabel];
    
    WS(weakSelf)
    [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(0);
        make.top.equalTo(weakSelf.view.mas_top).with.offset(10);
        make.height.mas_equalTo(@(80));
    }];
    
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.contentView];
    
    [weakSelf.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(10);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-10);
        make.top.equalTo(describeLabel.mas_bottom).with.offset(20);
        make.height.mas_equalTo(@50.f);
    }];
    
    self.leftLabel = [UILabel new];
    self.leftLabel.text = @"label,";
    self.leftLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.leftLabel];
    
    self.rightLabel = [UILabel new];
    self.rightLabel.text = @"label,";
    self.rightLabel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.rightLabel];
    
    [weakSelf.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_top).with.offset(5);
        make.left.equalTo(weakSelf.contentView.mas_left).with.offset(2);
        
        make.height.equalTo(@40);
    }];
    
    // label2: 位于右上角
    [weakSelf.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLabel.mas_right).with.offset(2);
        make.top.equalTo(weakSelf.contentView.mas_top).with.offset(5);
        make.right.lessThanOrEqualTo(weakSelf.contentView.mas_right).with.offset(-2);
        make.height.equalTo(@40);
    }];
    
    [self.leftLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.leftLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.rightLabel setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
        [self.rightLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];
    
    UIStepper *step1 = [UIStepper new];
    [self.view addSubview:step1];
    step1.tag = stepSelectSide_Left;
    [step1 addTarget:self action:@selector(addLabelContent:) forControlEvents:UIControlEventValueChanged];
    
    UIStepper *step2 = [UIStepper new];
    [self.view addSubview:step2];
    step2.tag = stepSelectSide_Right;
    [step2 addTarget:self action:@selector(addLabelContent:) forControlEvents:UIControlEventValueChanged];

    
    [step1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left);
        make.top.equalTo(weakSelf.contentView.mas_bottom).with.offset(20);
    }];
    [step2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right);
        make.top.equalTo(weakSelf.contentView.mas_bottom).with.offset(20);
    }];
}

- (void)addLabelContent:(UIStepper *)sender
{
    switch (sender.tag) {
        case stepSelectSide_Left:
            self.leftLabel.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;
          
        case stepSelectSide_Right:
            self.rightLabel.text = [self getLabelContentWithCount:(NSUInteger)sender.value];
            break;
            
        default:
            break;
    }
}

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    NSMutableString *ret = [NSMutableString new];
    
    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }
    
    return ret.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
