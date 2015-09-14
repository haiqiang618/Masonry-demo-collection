//
//  CustomCell.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "CustomCell.h"
#import "CustomModel.h"

@interface CustomCell ()

@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, strong) CustomModel *dataEntity;

@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    WS(weakSelf)
    // Avatar头像
    _avatarImageView = [UIImageView new];
    [weakSelf.contentView addSubview:_avatarImageView];
    [weakSelf.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@44);
        make.left.and.top.equalTo(self.contentView).with.offset(4);
    }];

    // Title - 单行
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    
    [weakSelf.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(weakSelf.contentView).with.offset(4);
        make.left.equalTo(weakSelf.avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(weakSelf.contentView).with.offset(-4);
    }];
    
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - (16 + 4) * 2 - 44 - 4;
    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    [self.contentView addSubview:_contentLabel];
    
    
    [weakSelf.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(weakSelf.avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(weakSelf.contentView).with.offset(-4);
        make.bottom.equalTo(weakSelf.contentView).with.offset(-4);
    }];

    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (void)setupData:(CustomModel *)dataEntity
{
    _dataEntity = dataEntity;
    
    _avatarImageView.image = dataEntity.avatar;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
