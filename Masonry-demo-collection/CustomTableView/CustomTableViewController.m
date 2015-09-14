//
//  CustomTableViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/14.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "CustomTableViewController.h"
#import "CustomCell.h"
#import "CustomModel.h"

// 注释掉下面的宏定义，就是用“传统”的模板Cell计算高度
//#define IOS_8_NEW_FEATURE_SELF_SIZING

@interface CustomTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [UITableView new];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 80.f;
    
    WS(weakSelf)
    [weakSelf.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
#endif
    
    [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:NSStringFromClass([CustomCell class])];
    [self generateData];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    // iOS 8 的Self-sizing特性
    return UITableViewAutomaticDimension;
#else
    static CustomCell *templateCell;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomCell class])];
    });
    
    // 获取对应的数据
    CustomModel *dataEntity = _data[(NSUInteger) indexPath.row];
    
    // 填充数据
    [templateCell setupData:dataEntity];
    
    // 判断高度是否已经计算过
    if (dataEntity.cellHeight <= 0) {
        // 根据当前数据，计算Cell的高度，注意+1
        dataEntity.cellHeight = [templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
        NSLog(@"Calculate height: %ld", (long) indexPath.row);
    } else {
        NSLog(@"Get cache %ld", (long) indexPath.row);
    }
    
    return dataEntity.cellHeight;
#endif
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomCell class]) forIndexPath:indexPath];
    [cell setupData:_data[(NSUInteger) indexPath.row]];
    return cell;
}


// 生成数据
- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        CustomModel *dataEntity = [CustomModel new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [tmpData addObject:dataEntity];
    }
    
    _data = tmpData;
}

// 重复text字符串repeat次
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    
    return tmpText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
