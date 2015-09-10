//
//  IntermediateSecondPartViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/9.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "IntermediateSecondPartViewController.h"

typedef NS_ENUM(NSInteger, PlantReferenceIndex) {
    PlantReferenceWaterIndex,
    PlantReferenceSumIndex,
    PlantReferenceTemperatureIndex,
    PlantReferenceElectrolyteIndex
};

@interface IntermediateSecondPartViewController ()

@end

@implementation IntermediateSecondPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureUI];
}

- (void)configureUI
{
    self.navigationController.navigationBar.translucent = NO;
    
    UIView *titleView = [UIView new];
    titleView.backgroundColor = [UIColor redColor];
    UIView *caredView = [UIView new];
    [self.view addSubview:caredView];
    UIView *brifeView = [UIView new];
    [self.view addSubview:brifeView];
    //self.view
    self.view.backgroundColor = [UIColor colorWithWhite:0.965 alpha:1.000];
    //thrm
    UIImageView *plantThrm = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"planet.jpg"]];
    [self.view addSubview:plantThrm];
    [plantThrm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(@(60));
        make.width.mas_equalTo(@(80));
    }];
    //title
    [self.view addSubview:titleView];
    UIImageView *bgTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-plant-reference-title"]];
    [titleView addSubview:bgTitleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.left.equalTo(plantThrm.mas_right).with.offset(20);
        make.centerY.equalTo(plantThrm.mas_centerY);
    }];
    [bgTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(titleView);
    }];
    UILabel *title = [[UILabel alloc]init];
    title.textColor =  [UIColor purpleColor];
    title.font = [UIFont fontWithName:@"Heiti SC" size:26];
    title.text = @"植物";
    [titleView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView.mas_left).offset(10);
        make.width.equalTo(titleView.mas_width);
        make.centerY.equalTo(titleView.mas_centerY);
    }];
    //植物养护
    UILabel *caredTitle = [[UILabel alloc]init];
    caredTitle.textColor =  [UIColor colorWithRed:0.172 green:0.171 blue:0.219 alpha:1.000];
    caredTitle.font = [UIFont fontWithName:@"Heiti SC" size:10];
    caredTitle.text = @"植物养护";
    [self.view addSubview:caredTitle];
    [caredTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(plantThrm.mas_bottom).with.offset(20);
        make.left.and.right.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(10);
    }];
    [self createIndexUIWithView:caredView];
    //将图层的边框设置为圆脚
    caredView.layer.cornerRadius = 5;
    caredView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    caredView.layer.borderWidth = 1;
    caredView.layer.borderColor = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    caredView.backgroundColor = [UIColor whiteColor];
    [caredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(caredTitle.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(brifeView);
    }];
    //植物简介
    UILabel *brifeTitle = [[UILabel alloc]init];
    brifeTitle.textColor =  [UIColor colorWithRed:0.172 green:0.171 blue:0.219 alpha:1.000];
    brifeTitle.font = [UIFont fontWithName:@"Heiti SC" size:10];
    brifeTitle.text = @"植物简介";
    [self.view addSubview:brifeTitle];
    [brifeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(caredView.mas_bottom).with.offset(20);
        make.left.and.right.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(10);
    }];
    //将图层的边框设置为圆脚
    brifeView.layer.cornerRadius = 5;
    brifeView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    brifeView.layer.borderWidth = 1;
    brifeView.layer.borderColor = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    brifeView.backgroundColor = [UIColor whiteColor];
    [brifeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(brifeTitle.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.height.equalTo(caredView);
    }];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineHeightMultiple = 20.f;
    paragraphStyle.maximumLineHeight = 25.f;
    paragraphStyle.minimumLineHeight = 15.f;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:12], NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName:[UIColor colorWithWhite:0.447 alpha:1.000]};
    
    //brifeView.text = _reference.brief;
    NSString *str = @"间接融资是直接融资的对称，亦称“间接金融”。是指拥有暂时闲置货币资金的单位通过存款的形式，或者购买银行、信托、保险等金融机构发行的有价证券，将其暂时闲置的资金先行提供给这些金融中介机构，然后再由这些金融机构以贷款、贴现等形式，或通过购买需要资金的单位发行的有价证券，把资金提供给这些单位使用，从而实现资金融通的过程。";

    UILabel *brifeLabel = [UILabel new];
    brifeLabel.numberOfLines = 0;
    brifeLabel.attributedText = [[NSAttributedString alloc] initWithString:str attributes:attributes];
    [brifeView addSubview:brifeLabel];
    
    [brifeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(brifeView.mas_top).with.offset(0);
        make.left.equalTo(brifeView.mas_left).with.offset(10);
        make.right.equalTo(brifeView.mas_right).with.offset(-10);
        make.bottom.equalTo(brifeView.mas_bottom).with.offset(-10);
    }];
}

// 将块拆分成为4行
- (void)createIndexUIWithView:(UIView *)view
{
    UIView *row1 = [UIView new];
    UIView *row2 = [UIView new];
    UIView *row3 = [UIView new];
    UIView *row4 = [UIView new];
    [view addSubview:row1];
    [view addSubview:row2];
    [view addSubview:row3];
    [view addSubview:row4];
    
    [row1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(view);
        make.height.equalTo(view.mas_height).multipliedBy(0.25);
        make.top.equalTo(view.mas_top);
    }];
    [row2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(view);
        make.top.equalTo(row1.mas_bottom);
        make.height.equalTo(view.mas_height).multipliedBy(0.25);
    }];
    [row3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_right);
        make.top.equalTo(row2.mas_bottom);
        make.height.equalTo(view.mas_height).multipliedBy(0.25);
        make.left.equalTo(view.mas_left);
    }];
    [row4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(view);
        make.top.equalTo(row3.mas_bottom);
        make.height.equalTo(view.mas_height).multipliedBy(0.25);
    }];
    
    [self createIndexRowUI:PlantReferenceWaterIndex withUIView:row1];
    [self createIndexRowUI:PlantReferenceSumIndex withUIView:row2];
    [self createIndexRowUI:PlantReferenceTemperatureIndex withUIView:row3];
    [self createIndexRowUI:PlantReferenceElectrolyteIndex withUIView:row4];
}

//构造每行的UI
-(void)createIndexRowUI:(PlantReferenceIndex) index withUIView:(UIView *)view {
    //index标题
    UILabel *indexTitle = [UILabel new];
    indexTitle.font = [UIFont fontWithName:@"HeiTi SC" size:14];
    indexTitle.textColor = [UIColor colorWithWhite:0.326 alpha:1.000];
    [view addSubview:indexTitle];
    [indexTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).with.offset(20);
        make.centerY.equalTo(view.mas_centerY);
    }];
    
    switch (index) {
        case PlantReferenceWaterIndex:
        {
            indexTitle.text = @"水分";
            UIImageView * current;
            for(int i=1;i<=5;i++){
                if(i<3){
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }else{
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }
                [view addSubview:current];
                //间距12%，左边留空30%
                [current mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).with.multipliedBy(0.12*(i-1) +0.3);
                    make.centerY.equalTo(view.mas_centerY);
                    make.size.mas_equalTo(CGSizeMake(30, 30));
                }];
            }
        }
            break;
        case PlantReferenceSumIndex:
        {
            indexTitle.text = @"光照";
            UIImageView * current;
            for(int i=1;i<=5;i++){
                if(i<3){
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }else{
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }
                [view addSubview:current];
                //间距12%，左边留空30%
                [current mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).with.multipliedBy(0.12*(i-1) +0.3);
                    make.centerY.equalTo(view.mas_centerY);
                    make.size.mas_equalTo(CGSizeMake(30, 30));
                }];
            }
        }
            break;
        case PlantReferenceTemperatureIndex:
        {
            indexTitle.text = @"温度";
            UIImageView * current;
            for(int i=1;i<=5;i++){
                if(i<3){
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }else{
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }
                [view addSubview:current];
                //间距12%，左边留空30%
                [current mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).with.multipliedBy(0.12*(i-1) +0.3);
                    make.centerY.equalTo(view.mas_centerY);
                    make.size.mas_equalTo(CGSizeMake(30, 30));
                }];
            }
        }
            break;
        case PlantReferenceElectrolyteIndex:
        {
            indexTitle.text = @"肥料";
            UIImageView * current;
            for(int i=1;i<=5;i++){
                if(i<3){
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }else{
                    current = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"water.jpg"]];
                }
                [view addSubview:current];
                //间距12%，左边留空30%
                [current mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).with.multipliedBy(0.12*(i-1) +0.3);
                    make.centerY.equalTo(view.mas_centerY);
                    make.size.mas_equalTo(CGSizeMake(30, 30));
                }];
            }
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
