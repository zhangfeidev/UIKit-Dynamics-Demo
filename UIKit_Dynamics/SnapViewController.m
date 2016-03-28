//
//  SnapViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  Snap:吸附

#import "SnapViewController.h"

@interface SnapViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;

@end

@implementation SnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Snap";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, self.view.frame.size.height-400, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTapGesture:)];
    [self.view addGestureRecognizer:self.tapGesture];
    // Do any additional setup after loading the view.
}


- (void)handTapGesture:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self.view];
    if (self.snapBehavior == nil) {
        self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.footballView snapToPoint:point];
        self.snapBehavior.damping = 0.75;
    }
    [self.animator addBehavior:self.snapBehavior];
}

@end
