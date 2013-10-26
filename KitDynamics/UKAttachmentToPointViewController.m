//
//  UKAttachmentToPointViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKAttachmentToPointViewController.h"

@implementation UKAttachmentToPointViewController

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
    // Przygotowanie widoku
    [self prepareView];
    
// ========================================================== //
    // 1. Utworzenie połączenia pomiędzy kwadratem a punktem
//    self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.rect attachedToAnchor:self.anchorPoint];
    
    // 1.1 Inny punkt zaczepu
//    self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.rect offsetFromCenter:UIOffsetMake(10.0f, 10.0f) attachedToAnchor:self.anchorPoint];
    
    // 2. Dodatnie nowego zachowania do animatora
//    [self.animator addBehavior:self.attachment];
    
    // 3. Ustawienie własności tłumienia
//    self.attachment.damping = 0.4f;
    
    // 4. Ustawienie częstotliwości drgań sprężyny
//    self.attachment.frequency = 2.0f;
    
    // 5. Ustawienie długości połączenia pomiędzy obiektami
//    self.attachment.length = 150.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareView
{
    // Stworzenie kwadratu
    self.rect = [self createRect];
    [self.view addSubview:self.rect];

    self.anchorPoint = CGPointMake(160.0f, 150.0f);
    
    // Stworzenie widoku kółka
    self.circleView = [self createCircleToViewAtPoint:self.anchorPoint withSize:CGSizeMake(20.0f, 20.0f)];
    [self.view addSubview:self.circleView];
    
    
    [self setupTouchGestureRecognizer];
    __weak UKAttachmentToPointViewController *wself = self;
    self.tapGestureBlock = ^(UIGestureRecognizer *rec) {
        CGPoint tapPoint = [rec locationInView:wself.view];
        [wself positionView:wself.circleView atPoint:tapPoint];
        [wself.attachment setAnchorPoint:tapPoint];
    };
    
    // Configure UIKitDynamics
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.rect]];
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.rect]];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
}

- (void)restoreState
{
    [self.attachment setAnchorPoint:self.anchorPoint];
}

@end
