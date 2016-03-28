//
//  ForcesViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  推力

#import "ForcesViewController.h"

@interface ForcesViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation ForcesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Forces";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, self.view.frame.size.height-400, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.footballView]];
    [self.animator addBehavior:collisionBehavior];
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.footballView] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = 0.0;
    pushBehavior.magnitude = 0.;
    
    self.pushBehavior = pushBehavior;
    [self.animator addBehavior:self.pushBehavior];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handTapGesture:)];
    [self.view addGestureRecognizer:self.tapGesture];
    // Do any additional setup after loading the view.
}

- (void)handTapGesture:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self.view];
    CGPoint origin = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    CGFloat distance = sqrtf(powf(point.x-origin.x, 2.0) + powf(point.y-origin.y, 2.0));
    CGFloat angle = atan2(point.y-origin.y, point.x-origin.x);
    distance = MIN(distance, 100.0);
    [self.pushBehavior setMagnitude:distance/100.0];
    [self.pushBehavior setAngle:angle];
    [self.pushBehavior setActive:true];
}

@end
