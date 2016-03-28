//
//  SpringsViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  Spring：弹簧效果

#import "SpringsViewController.h"

@interface SpringsViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UIImageView *basketballView;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation SpringsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Springs";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, self.view.frame.size.height-400, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.basketballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basketball"]];
    self.basketballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 10, 100, 100);
    [self.view addSubview:self.basketballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.basketballView]];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    [collisionBehavior setCollisionMode:UICollisionBehaviorModeEverything];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    CGPoint basketballCenter = CGPointMake(self.basketballView.center.x, self.basketballView.center.y);
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.basketballView attachedToAnchor:basketballCenter];
    [self.attachmentBehavior setFrequency:1.0f];
    [self.attachmentBehavior setDamping:0.1f];
    [self.attachmentBehavior setLength:50.0f];
    
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:self.attachmentBehavior];
    
    //给basketballView添加一个手势
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handAttachmentesture:)];
    [self.view addGestureRecognizer:self.panGesture];
    
    // Do any additional setup after loading the view.
}

- (void)handAttachmentesture:(UIPanGestureRecognizer *)gesture{
    CGPoint gesturePoint = [gesture locationInView:self.view];
    self.basketballView.center = gesturePoint;
    [self.attachmentBehavior setAnchorPoint:gesturePoint];
}

@end
