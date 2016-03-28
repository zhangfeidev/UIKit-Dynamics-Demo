//
//  ViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//

#import "ViewController.h"
#import "GravityViewController.h"
#import "CollisionsViewController.h"
#import "AttachmentsViewController.h"
#import "SpringsViewController.h"
#import "SnapViewController.h"
#import "ForcesViewController.h"
#import "PropertiesViewController.h"

static NSString *rid=@"reuseIdentifier";

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tabview;
@property (nonatomic, copy) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIKit Dynamics";
    self.data = @[@"Gravity",@"Collisions",@"Attachments",@"Springs",@"Snap",@"Forces",@"Properties"];
    
    self.tabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60) style:UITableViewStylePlain];
    self.tabview.delegate = self;
    self.tabview.dataSource = self;
    self.tabview.tableFooterView = [UIView new];
    [self.view addSubview:self.tabview];
    //解决iOS7上控制器UI会少60像素问题，但是导航条会失去半透明效果
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark UITableView 代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell == nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tabview deselectRowAtIndexPath:indexPath animated:YES];
    long index = (long)indexPath.row;
    switch (index) {
        case 0:{
            GravityViewController *gravityVC = [[GravityViewController alloc] init];
            [self.navigationController pushViewController:gravityVC animated:YES];
        }
            break;
        case 1:{
            CollisionsViewController *collisionsVC = [[CollisionsViewController alloc] init];
            [self.navigationController pushViewController:collisionsVC animated:YES];
        }
            break;
        case 2:{
            AttachmentsViewController *attachmentsVC = [[AttachmentsViewController alloc] init];
            [self.navigationController pushViewController:attachmentsVC animated:YES];
        }
            break;
        case 3:{
            SpringsViewController *springsVC = [[SpringsViewController alloc] init];
            [self.navigationController pushViewController:springsVC animated:YES];
        }
            break;
        case 4:{
            SnapViewController *snapVC = [[SnapViewController alloc] init];
            [self.navigationController pushViewController:snapVC animated:YES];
        }
            break;
        case 5:{
            ForcesViewController *forcesVC = [[ForcesViewController alloc] init];
            [self.navigationController pushViewController:forcesVC animated:YES];
        }
            break;
        case 6:{
            PropertiesViewController *proopertiesVC = [[PropertiesViewController alloc] init];
            [self.navigationController pushViewController:proopertiesVC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
