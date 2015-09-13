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

static const CGFloat IMAGE_SIZE = 32;

@interface SideBySideViewController ()

//并排
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

//显示与隐藏
@property (nonatomic, strong) UIView *contentView2;
@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) NSMutableArray *widthConstraints;
@property (strong, nonatomic) NSArray *imageNames;

//
@property (nonatomic, strong) UIView *contentView3;
@property (nonatomic, strong) UIView *subView3;

@property (nonatomic, strong) NSLayoutConstraint *widthConstraint;
@property (assign, nonatomic) CGFloat maxWidth;

@end

@implementation SideBySideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageViews = [NSMutableArray new];
    _widthConstraints = [NSMutableArray new];
    _imageNames = @[@"bluefaces_1", @"bluefaces_2", @"bluefaces_3", @"bluefaces_4"];
    
    [self configureUI];
}

- (void)configureUI
{
    self.navigationController.navigationBar.translucent = NO;
 
    WS(weakSelf)

    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    UIView *totalContainerView = [UIView new];
    [scrollView addSubview:totalContainerView];
    
    [totalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.mas_equalTo(scrollView.mas_width);
    }];
    
    // 并排显示label
    UILabel *describeLabel = [UILabel new];
    describeLabel.text = @"并排两个label，整体靠左边，宽度随内容增长，左边的label“优先级更高”。";
    describeLabel.numberOfLines = 2;
    [totalContainerView addSubview:describeLabel];
    
    [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalContainerView.mas_left).with.offset(10);
        make.right.equalTo(totalContainerView.mas_right).with.offset(0);
        make.top.equalTo(totalContainerView.mas_top).with.offset(10);
        make.height.mas_equalTo(@(80));
    }];
    
    self.contentView = [UIView new];
    self.contentView.backgroundColor = [UIColor greenColor];
    [totalContainerView addSubview:self.contentView];
    
    [weakSelf.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalContainerView.mas_left).with.offset(10);
        make.right.equalTo(totalContainerView.mas_right).with.offset(-10);
        make.top.equalTo(describeLabel.mas_bottom).with.offset(20);
        make.height.mas_equalTo(@50.f);
    }];
    
    self.leftLabel = [UILabel new];
    self.leftLabel.text = @"label,";
    self.leftLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.leftLabel];
    
    self.rightLabel = [UILabel new];
    self.rightLabel.text = @"label,";
    self.rightLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.rightLabel];
    
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
        make.left.equalTo(totalContainerView.mas_left);
        make.top.equalTo(weakSelf.contentView.mas_bottom).with.offset(20);
    }];
    [step2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(totalContainerView.mas_right);
        make.top.equalTo(weakSelf.contentView.mas_bottom).with.offset(20);
    }];
    
    //四个label显示与隐藏
    UILabel *describe2 = [UILabel new];
    describe2.numberOfLines = 2;
    describe2.text = @"四个图标并排显示，隐藏、显示其中任意个，整体保持居中。";
    [totalContainerView addSubview:describe2];
    
    [describe2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(step2.mas_bottom).with.offset(20);
        make.left.equalTo(totalContainerView.mas_left).with.offset(10);
        make.right.equalTo(totalContainerView.mas_right).with.offset(0);
        make.height.mas_equalTo(@80.f);
    }];
    
    self.contentView2 = [UIView new];
    [totalContainerView addSubview:self.contentView2];
    self.contentView2.backgroundColor = [UIColor blueColor];
    
    [weakSelf.contentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(IMAGE_SIZE));
        make.centerX.equalTo(totalContainerView.mas_centerX);
        make.top.equalTo(describe2.mas_bottom).with.offset(20);
    }];
    
    for (NSUInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageNames[i]]];
        [_imageViews addObject:imageView];
        [self.contentView2 addSubview:imageView];
    }
    
    //设定大小
    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);
    
    //分别设置每个imageView的宽高、左边、垂直中心约束，注意约束的对象
    //每个View的左边约束和左边的View的右边相等=。=，有点绕口...
    
    UIImageView *imageView1 = _imageViews[0];
    MASConstraint *width = [self setView:imageView1 size:imageViewSize left:self.contentView2.mas_left centerY:self.contentView2.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView2 = _imageViews[1];
    width = [self setView:imageView2 size:imageViewSize left:imageView1.mas_right centerY:self.contentView2.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView3 = _imageViews[2];
    width = [self setView:imageView3 size:imageViewSize left:imageView2.mas_right centerY:self.contentView2.mas_centerY];
    [_widthConstraints addObject:width];
    
    UIImageView *imageView4 = _imageViews[3];
    width = [self setView:imageView4 size:imageViewSize left:imageView3.mas_right centerY:self.contentView2.mas_centerY];
    [_widthConstraints addObject:width];
    
    //最后设置最右边的imageView的右边与父view的右对齐
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.contentView2.mas_right);
    }];
    
    UIView *slideView = [UIView new];
    [totalContainerView addSubview:slideView];
    
    [slideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView2.mas_bottom).with.offset(20);
        make.height.mas_equalTo(@(40));
        make.width.mas_equalTo(@(220));
        make.centerX.mas_equalTo(totalContainerView.mas_centerX);
    }];
    
    for (NSInteger i=0; i<4; i++) {
        UISwitch *switchV = [UISwitch new];
        switchV.on = YES;
        switchV.tag = i;
        [slideView addSubview:switchV];
        [switchV addTarget:self action:@selector(showOrHideImage:) forControlEvents:UIControlEventValueChanged];
        [switchV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(slideView.mas_left).with.offset(10+(51+2)*(i));
            make.top.equalTo(slideView.mas_top).with.offset(5);
        }];
    }
    
//  子View的宽度始终是父View宽度的一半
    UILabel *describe3 = [UILabel new];
    [totalContainerView addSubview:describe3];
    describe3.text = @"子View的宽度始终是父View宽度的一半";
    
    [describe3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(slideView.mas_bottom).with.offset(20);
        make.left.equalTo(totalContainerView.mas_left).with.offset(10);
    }];
    
    _contentView3 = [UIView new];
    _contentView3.backgroundColor = [UIColor purpleColor];
    [totalContainerView addSubview:_contentView3];
    
    _widthConstraint = [NSLayoutConstraint constraintWithItem:self.contentView3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:288.0f];
    
    _maxWidth = _widthConstraint.constant;
    
    [weakSelf.contentView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(totalContainerView.mas_left).with.offset(10);
        make.top.equalTo(describe3.mas_bottom).with.offset(10);
        make.width.mas_equalTo(@(_maxWidth));
        make.height.mas_equalTo(@80.f);
    }];
   
    
    
    _subView3 = [UIView new];
    _subView3.backgroundColor = [UIColor redColor];
    [_contentView3 addSubview:_subView3];
    
    [_subView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView3.mas_left);
        make.top.equalTo(weakSelf.contentView3.mas_top);
        make.bottom.equalTo(weakSelf.contentView3.mas_bottom);
        
        //宽度为父view的宽度的一半
        make.width.mas_equalTo(@(_maxWidth/2.0));
    }];
    
    UISlider *slider = [UISlider new];
    slider.maximumValue = 1.0f;
    slider.minimumValue = 0.0f;
    slider.value = 1.0f;
    [totalContainerView addSubview:slider];
    [slider addTarget:self action:@selector(modifyContainerViewWidth:) forControlEvents:UIControlEventValueChanged];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView3.mas_bottom).with.offset(10);
        make.height.mas_equalTo(@30.f);
        make.left.equalTo(weakSelf.contentView3.mas_left);
        make.right.equalTo(weakSelf.contentView3.mas_right);
    }];
    
    [totalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(slider.mas_bottom).with.offset(20);
    }];
}

#pragma mark ---修改宽度
- (void)modifyContainerViewWidth:(UISlider *)sender
{
    if (sender.value) {
        self.contentView3.width = sender.value * _maxWidth;
        _subView3.width = sender.value * _maxWidth * 0.5;
    }
}

#pragma mark 显示以及隐藏
- (void)showOrHideImage:(UISwitch *)sender {
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *width = _widthConstraints[index];
    
    if (sender.on) {
        width.equalTo(@(IMAGE_SIZE));
    } else {
        width.equalTo(@0);
    }
}

- (MASConstraint *)setView:(UIView *)view size:(CGSize)size left:(MASViewAttribute *)left centerY:(MASViewAttribute *)centerY {
    
    __block MASConstraint *widthConstraint;
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //宽高固定
        widthConstraint = make.width.equalTo(@(size.width));
        make.height.equalTo(@(size.height));
        //左边约束
        make.left.equalTo(left);
        //垂直中心对齐
        make.centerY.equalTo(centerY);
    }];
    
    return widthConstraint;
}

#pragma mark 追加字符串
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
