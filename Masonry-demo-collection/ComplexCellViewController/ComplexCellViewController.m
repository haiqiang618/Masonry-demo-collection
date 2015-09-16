//
//  ComplexCellViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/16.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "ComplexCellViewController.h"
#import "ComplexTableViewCell.h"

@interface ComplexCellViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ComplexCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WS(weakSelf)
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[ComplexTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    [weakSelf.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ComplexTableViewCell getHeightByType:indexPath.row%6];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ComplexTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.type = indexPath.row%6;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
