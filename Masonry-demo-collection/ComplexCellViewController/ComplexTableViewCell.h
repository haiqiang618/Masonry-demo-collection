//
//  ComplexTableViewCell.h
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/16.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ComplexType) {
    ComplexType1111,
    ComplexType1110,
    ComplexType0111,
    ComplexType0011,
    ComplexType0010,
    ComplexType1101
};

@interface ComplexTableViewCell : UITableViewCell

@property (nonatomic, assign) ComplexType type;

+ (CGFloat)getHeightByType:(NSInteger)row;

@end
