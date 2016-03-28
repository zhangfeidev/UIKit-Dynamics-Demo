//
//  GravityViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  Gravity：重力

#import "GravityViewController.h"

@interface GravityViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation GravityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Gravity";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 100, 100, 100);
    [self.view addSubview:footballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[footballView]];
    //angle:角度(弧度)  magnitude:量级(重力系数)
    [gravityBehavior setAngle:3.14/2 magnitude:0.1f];
    [self.animator addBehavior:gravityBehavior];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
