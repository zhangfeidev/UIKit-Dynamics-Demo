//
//  AttachmentsViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  Attachments：链接

#import "AttachmentsViewController.h"

@interface AttachmentsViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UIImageView *basketballView;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation AttachmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Attachments";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, self.view.frame.size.height-400, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.basketballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basketball"]];
    self.basketballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 10, 100, 100);
    [self.view addSubview:self.basketballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    [collisionBehavior setCollisionMode:UICollisionBehaviorModeEverything];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    CGPoint basketballCenter = CGPointMake(self.basketballView.center.x, self.basketballView.center.y);
    
    self.attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.basketballView attachedToAnchor:basketballCenter];
    
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:self.attachmentBehavior];
    
    //给basketballView添加一个手势
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handAttachmentesture:)];
    [self.view addGestureRecognizer:self.panGesture];
}

- (void)handAttachmentesture:(UIPanGestureRecognizer *)gesture{
    CGPoint gesturePoint = [gesture locationInView:self.view];
    self.basketballView.center = gesturePoint;
    [self.attachmentBehavior setAnchorPoint:gesturePoint];
}
@end
