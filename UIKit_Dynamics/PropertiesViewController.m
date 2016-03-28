//
//  PropertiesViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//

#import "PropertiesViewController.h"

@interface PropertiesViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UIImageView *basketballView;

@end

@implementation PropertiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Properties";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0-60, self.view.frame.size.height-400, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.basketballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basketball"]];
    self.basketballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0+60, 10, 100, 100);
    [self.view addSubview:self.basketballView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.footballView]];
    propertiesBehavior.elasticity = 1.f;
    propertiesBehavior.allowsRotation = NO;
    propertiesBehavior.angularResistance = 0.f;
    propertiesBehavior.density = 3.f;
    propertiesBehavior.friction = 0.5f;
    propertiesBehavior.resistance = 0.5f;
    
    [self.animator addBehavior:propertiesBehavior];
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    
    /*
     elasticity:表示与其他物体碰撞时的弹性，取值0-1，0表示没有弹性，1表示反弹作用力与碰撞作用力相等
     allowsRotation：指定物体在受力时是否会旋转，默认YES
     angularResistance：旋转助力，值越大旋转下降得越快，取值为0-CGFLOAT_MAX
     density：物体的密度，调整密度会影响重力和碰撞的效果。默认情况下，100x100的物体质量为1，100x200为2
     friction：物体之间的滑动阻力，0表示没有摩擦力，1表示摩擦力很大
     resistance：空气阻力，取值为0-CGFLOAT_MAX，0表示没有空气阻力，1表示一旦其他作用力消失，物体就会停止
     */
    
}

@end
