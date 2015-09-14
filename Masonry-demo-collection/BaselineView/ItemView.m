//
//  ItemView.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "ItemView.h"

@interface ItemView ()

@property (strong, nonatomic) UIView *baseView;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;

@end

@implementation ItemView

+ (instancetype)newItemWithImage:(UIImage *)image text:(NSString *)text {
    ItemView *item = [ItemView new];
    item.image = image;
    item.text = text;
    [item initView];
    
    return item;
}

- (void)initView
{
    self.backgroundColor = [UIColor lightGrayColor];
    
    // ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_image];
    self.baseView = imageView;
    
    // Label
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.text = _text;
    label.textColor = [UIColor whiteColor];
    
    [self addSubview:imageView];
    [self addSubview:label];
    
    // ImageView
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(4);
        make.top.equalTo(self.mas_top).with.offset(4);
        make.right.equalTo(self.mas_right).with.offset(-4);
    }];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // Label
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(imageView.mas_width);
        make.left.equalTo(imageView.mas_left);
        make.top.equalTo(imageView.mas_bottom).with.offset(4);
        make.bottom.equalTo(self.mas_bottom).with.offset(-4);
    }];
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

#pragma mark - Override

// 返回自定义的baseline的view
- (UIView *)viewForBaselineLayout {
    return _baseView;
}

@end
