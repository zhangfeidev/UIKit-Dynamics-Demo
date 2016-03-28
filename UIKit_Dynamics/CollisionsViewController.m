//
//  CollisionsViewController.m
//  UIKit_Dynamics
//
//  Created by zhangfei on 16/3/14.
//  Copyright © 2016年 zhangfei. All rights reserved.
//  Collisions：碰撞

#import "CollisionsViewController.h"

@interface CollisionsViewController () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIImageView *footballView;
@property (nonatomic, strong) UIImageView *basketballView;
@property (nonatomic, strong) UILabel *collisonLable;

@end

@implementation CollisionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Collisions";
    self.view.backgroundColor = [UIColor whiteColor];

    self.footballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football"]];
    self.footballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, self.view.frame.size.height-300, 100, 100);
    [self.view addSubview:self.footballView];
    
    self.basketballView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"basketball"]];
    self.basketballView.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 10, 100, 100);
    [self.view addSubview:self.basketballView];
    
    self.collisonLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 40)];
    [self.view addSubview:self.collisonLable];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    //angle:角度(弧度)  magnitude:量级(重力系数)
    [gravityBehavior setAngle:3.14/2 magnitude:0.1f];

    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.footballView,self.basketballView]];
    /**
     *  UICollisionBehaviorModeEverything:物体既相互碰撞又与边界碰撞
     *  UICollisionBehaviorModeBoundaries:物体不相互碰撞，只与边界碰撞
     *  UICollisionBehaviorModeItems:物体相互碰撞，不与边界碰撞
     */
    [collisionBehavior setCollisionMode:UICollisionBehaviorModeEverything];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;
    
    
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    // Do any additional setup after loading the view.
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    if ([item isEqual:_footballView]) {
        self.collisonLable.text = @"footballView";
    }
    if ([item isEqual:_basketballView]) {
        self.collisonLable.text = @"basketballView";
    }
    NSLog(@"%@",NSStringFromCGPoint(p));
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p{
    NSLog(@"p:%@",NSStringFromCGPoint(p));
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    NSLog(@"Collision did end");
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2{
    NSLog(@"Collision did end !");
}
@end
