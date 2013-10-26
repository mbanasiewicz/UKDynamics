//
//  UKDynamicsBaseViewController.h
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UKDynamicsBaseViewController : UIViewController
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIAttachmentBehavior *attachment;
@property (nonatomic, strong) UISnapBehavior *snap;
@property (nonatomic, strong) UIPushBehavior *push;
// Blocks
@property (nonatomic, copy)  void (^tapGestureBlock)(UIGestureRecognizer *);
@property (nonatomic, copy)  void (^panGestureBlock)(UIGestureRecognizer *);
@property (assign) CGRect originalRectFrame;
@property (nonatomic, strong) UIView *rect;
@property (nonatomic, strong) UIView *collisionRect;
@property (nonatomic, readwrite) UIEdgeInsets collisionEdgeInsets;
@property (nonatomic, assign) CGPoint anchorPoint;
@property (nonatomic, strong) UIView *circleView;
@property (nonatomic) BOOL showsAddRectButton;
// Point utils
- (UIView *)createRect;
- (UIView *)createRectWithCenter:(CGPoint)p;
- (CGPoint)leftHalf;
- (CGPoint)rightHalf;
- (void)restoreState;
- (UIView *)createCircleToViewAtPoint:(CGPoint)p withSize:(CGSize)size;
- (void)positionView:(UIView *)view atPoint:(CGPoint)p;
- (void)setupTouchGestureRecognizer;
- (void)setupPanGestureRecognizer;
@end
