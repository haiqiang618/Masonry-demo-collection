//
//  CustomModel.h
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (strong, nonatomic) UIImage *avatar;

// Cache
@property (assign, nonatomic) CGFloat cellHeight;

@end
