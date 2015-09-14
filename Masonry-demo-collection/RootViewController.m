//
//  ViewController.m
//  Masonry-demo-collection
//
//  Created by IOF－IOS2 on 15/9/7.
//  Copyright (c) 2015年 IOF－IOS2. All rights reserved.
//

#import "RootViewController.h"
#import "PrimaryViewController.h"
#import "IntermediateViewController.h"
#import "IntermediateSecondPartViewController.h"
#import "SideBySideViewController.h"
#import "CustomTableViewController.h"
#import "LayoutGuideViewController.h"
#import "BaseLineViewController.h"

static NSString *cellIdentifier = @"masonryCell";

@interface RootViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *classArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews
{
    self.title = @"Masonry 学习";
    self.dataArray = @[@"初级", @"中级－－－计算器", @"中级－－－植物图谱", @"中级－－－并排, 居中, 百分比", @"中级－－－UITableView", @"中级－－－top(bottom)GuideView", @"中级－－－自定义baseline", @"敬请期待－－－高级"];
    self.classArray = @[@"PrimaryViewController",@"IntermediateViewController",@"IntermediateSecondPartViewController",@"SideBySideViewController",@"CustomTableViewController",@"LayoutGuideViewController",@"BaseLineViewController",@""];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *className = self.classArray[indexPath.row] ? self.classArray[indexPath.row] : @"";
    if ([className isEqualToString:@""]) {
        return;
    }
    UIViewController *pvc = [NSClassFromString(className) new];
    [self.navigationController pushViewController:pvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
