//
//  ComplexTableViewCell.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/16.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "ComplexTableViewCell.h"

@interface ComplexTableViewCell ()

//在Masonry中 针对单条的MASLayoutConstraint可以进行active和deactive操作 那么意味着可以动态的启用或者禁用某条预置的约束

@property (nonatomic, strong) MASConstraint *cF; //constraint first row
@property (nonatomic, strong) MASConstraint *cB; //constraint blue
@property (nonatomic, strong) MASConstraint *cY; //constraint yellow
@property (nonatomic, strong) MASConstraint *cR; //constraint red
@property (nonatomic, strong) MASConstraint *cG; //constraint green

@property (nonatomic, strong) UIView *gF; //group first row
@property (nonatomic, strong) UIView *gB; //group blue
@property (nonatomic, strong) UIView *gY; //group yellow
@property (nonatomic, strong) UIView *gR; //group red
@property (nonatomic, strong) UIView *gG; //group green

@property (nonatomic, strong) UIView *vB; //view blue    height:30
@property (nonatomic, strong) UIView *vY; //view yellow  height:30
@property (nonatomic, strong) UIView *vR; //view red     height:30
@property (nonatomic, strong) UIView *vG; //view green   height:100

@end

@implementation ComplexTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat spacing = 20.0f;
        
        WS(weakSelf)

        self.gF = [UIView new];
        [self.contentView addSubview:self.gF];
        [weakSelf.gF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(weakSelf.contentView);
            
            self.cF = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cF deactivate];
        }];
        self.gF.clipsToBounds = YES;
        
        self.gB = [UIView new];
        [self.gF addSubview:self.gB];
        [weakSelf.gB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(weakSelf.gF);
            
            self.cB = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cB deactivate];
        }];
        self.gB.clipsToBounds = YES;
        
        self.gY = [UIView new];
        [self.gF addSubview:self.gY];
        [weakSelf.gY mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self.gF);
            make.left.equalTo(self.gB.mas_right);
            
            self.cY = make.width.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cY deactivate];
        }];
        self.gY.clipsToBounds = YES;

        self.gR = [UIView new];
        [self.contentView addSubview:self.gR];
        [self.gR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gF.mas_bottom);
            
            self.cR = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cR deactivate];
        }];
        self.gR.clipsToBounds = YES;
        
        self.gG = [UIView new];
        [self.contentView addSubview:self.gG];
        [self.gG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.gR.mas_bottom);
            
            self.cG = make.height.equalTo(@0).priority(UILayoutPriorityRequired);
            [self.cG deactivate];
        }];
        self.gG.clipsToBounds = YES;
        
        self.vB = [UIView new];
        [self.gB addSubview:self.vB];
        
        [weakSelf.vB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.equalTo(weakSelf.gB).with.insets(UIEdgeInsetsMake(spacing, spacing, 0, 0)).priorityLow();
            make.width.mas_equalTo(@60);
            make.height.equalTo(@30);
        }];
        self.vB.backgroundColor = [UIColor blueColor];
        
        self.vY = [UIView new];
        [self.gY addSubview:self.vY];
        [weakSelf.vY mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.gY).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        self.vY.backgroundColor = [UIColor yellowColor];
        
        self.vR = [UIView new];
        [self.gR addSubview:self.vR];
        [weakSelf.vR mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.gR).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@30);
        }];
        self.vR.backgroundColor = [UIColor redColor];
        
        self.vG = [UIView new];
        [self.gG addSubview:self.vG];
        [weakSelf.vG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.gG).insets(UIEdgeInsetsMake(spacing, spacing, 0, spacing)).priorityLow();
            make.height.equalTo(@100);
        }];
        self.vG.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)setType:(ComplexType)type {
    
    [self.cF deactivate];
    [self.cB deactivate];
    [self.cY deactivate];
    [self.cR deactivate];
    [self.cG deactivate];
    
    switch (type) {
        case ComplexType1111:
        {
            break;
        }
        case ComplexType0111:
        {
            [self.cB activate];
            break;
        }
        case ComplexType0011:
        {
            [self.cF activate];
            break;
        }
        case ComplexType1110:
        {
            [self.cG activate];
            break;
        }
        case ComplexType1101:
        {
            [self.cR activate];
            break;
        }
        case ComplexType0010:
        {
            [self.cF activate];
            [self.cG activate];
            break;
        }
            
        default:
            break;
    }
}

+ (CGFloat)getHeightByType:(NSInteger)row
{
    switch (row) {
        case ComplexType1111:
        {
            return 240.f;
            break;
        }
        case ComplexType0111:
        {
            return 240.f;
            break;
        }
        case ComplexType0011:
        {
            return 190.f;
            break;
        }
        case ComplexType1110:
        {
            return 120.f;
            break;
        }
        case ComplexType1101:
        {
            return 190.f;
            break;
        }
        case ComplexType0010:
        {
            return 70.f;
            break;
        }
            
        default:
            return 0;
            break;
    }
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
