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

static NSString *cellIdentifier = @"masonryCell";

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews
{
    self.title = @"Masonry 学习";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
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
    if (indexPath.row == 0) {
        cell.textLabel.text = @"初级";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"中级－－－计算器";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"中级－－－植物图谱";
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = @"中级－－－并排label, 自动居中, 百分比宽度";
    }
    if (indexPath.row == 4) {
        cell.textLabel.text = @"中级－－－UITableView";
    }
    if (indexPath.row == 5) {
        cell.textLabel.text = @"中级－－－top(bottom)GuideView";
    }
    if (indexPath.row == 6) {
        cell.textLabel.text = @"中级－－－自定义baseline";
    }
    if (indexPath.row == 7) {
        cell.textLabel.text = @"敬请期待－－－高级";
    }
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        PrimaryViewController *pvc = [PrimaryViewController new];
        [self.navigationController pushViewController:pvc animated:YES];
    } else if (indexPath.row == 1) {
        IntermediateViewController *ivc = [IntermediateViewController new];
        [self.navigationController pushViewController:ivc animated:YES];
    } else if (indexPath.row == 2) {
        IntermediateSecondPartViewController *spvc = [IntermediateSecondPartViewController  new];
        [self.navigationController pushViewController:spvc animated:YES];
    } else if (indexPath.row == 3) {
        SideBySideViewController *svc = [SideBySideViewController new];
        [self.navigationController pushViewController:svc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
