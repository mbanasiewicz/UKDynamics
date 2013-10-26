//
//  UKDynamicsBaseViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKDynamicsBaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UKCircleView.h"

@interface UKDynamicsBaseViewController ()

@end

@implementation UKDynamicsBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createBarButtonItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Draw Collision Edge View
- (void)setCollisionEdgeInsets:(UIEdgeInsets)collisionEdgeInsets
{
    _collisionEdgeInsets = collisionEdgeInsets;
    CGRect collisionRect = UIEdgeInsetsInsetRect(self.view.bounds, self.collisionEdgeInsets);

    self.collisionRect = [[UIView alloc] initWithFrame:collisionRect];
    self.collisionRect.layer.borderColor = [UIColor redColor].CGColor;
    self.collisionRect.layer.borderWidth = 2.0f;
    [self.view insertSubview:self.collisionRect belowSubview:self.rect];
}

#pragma mark Navigation Bar Items

- (void)createBarButtonItems
{
    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                            target:self action:@selector(restoreState)];
    self.navigationItem.rightBarButtonItems = @[reload];
    if (self.showsAddRectButton)
    {
        [self createAddRectButton];
    }
}
- (void)createAddRectButton
{
    NSMutableArray *buttonsArray = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
    UIBarButtonItem *addRect = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRectToView)];
    [buttonsArray addObject:addRect];
    self.navigationItem.rightBarButtonItems = [buttonsArray copy];
}

#pragma mark Tap Gesture Recognizer

- (void)setupPanGestureRecognizer
{
    UIPanGestureRecognizer *panpGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panpGestureRecognizer];
}

- (void)handlePan:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.panGestureBlock)
    {
        self.panGestureBlock(gestureRecognizer);
    }
}

#pragma mark Tap Gesture Recognizer

- (void)setupTouchGestureRecognizer
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleTap:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.tapGestureBlock)
    {
        self.tapGestureBlock(gestureRecognizer);
    }
}
#pragma mark Utils
- (CGPoint)leftHalf
{
    CGFloat x = self.view.bounds.size.width / 4.0f;
    CGFloat y = self.view.bounds.size.height / 4.0f;
    return CGPointMake(x, y);
}
- (CGPoint)rightHalf
{
    CGFloat x = self.view.bounds.size.width * (3.0f / 4.0f);
    CGFloat y = self.view.bounds.size.height / 4.0f;
    return CGPointMake(x, y);
}
- (UIView *)createRectWithCenter:(CGPoint)p
{
    CGFloat x = p.x - 50.0f;
    CGFloat y = p.y - 50.0f;
    self.originalRectFrame = CGRectMake(x, y, 100.0f, 100.0f);
    UIView *rect = [[UIView alloc] initWithFrame:self.originalRectFrame];
    [rect setBackgroundColor:[UIColor grayColor]];
    return rect;
}
- (UIView *)createRect
{
    return [self createRectWithCenter:self.view.center];
}

- (void)addRectToView
{
    UIView *rect = [self createRect];
    [self.view addSubview:rect];
    [self.gravity addItem:rect];
    [self.collision addItem:rect];
}

- (UIView *)createCircleToViewAtPoint:(CGPoint)p withSize:(CGSize)size
{
    UKCircleView *circleView = [[UKCircleView alloc] initWithFrame:CGRectMake(p.x - size.width / 2.0f, p.y - size.height / 2.0f, size.width, size.height)];
    return circleView;
}
- (void)positionView:(UIView *)view atPoint:(CGPoint)p
{
    CGSize size = view.bounds.size;
    CGRect newFrame = CGRectMake(p.x - size.width / 2.0f, p.y - size.height / 2.0f, size.width, size.height);
    [view setFrame:newFrame];
}
- (void)restoreState
{
    // void ...
}

@end
