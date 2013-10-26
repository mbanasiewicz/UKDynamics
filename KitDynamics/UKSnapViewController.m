
//
//  UKSnapViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKSnapViewController.h"

@implementation UKSnapViewController

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
    // 1. Utworzenie zachowania przyciągania
//    self.snap = [[UISnapBehavior alloc] initWithItem:self.rect snapToPoint:self.view.center];

    // 2. Dadanie zachowania przyciągania do animatora
//    [self.animator addBehavior:self.snap];
    
    // 3. Zmiana współczynnika oscylacji
//    [self.snap setDamping:1.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareView
{
    // Stworzenie animatora
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // Stworzenie kwadratu
    self.rect = [self createRect];
    [self.view addSubview:self.rect];
    
    [self setupTouchGestureRecognizer];
    __weak UKSnapViewController *wself = self;
    self.tapGestureBlock = ^(UIGestureRecognizer *recognizer) {
        CGPoint tapPoint = [recognizer locationInView:wself.view];
        [wself.animator removeAllBehaviors];
        wself.snap = [[UISnapBehavior alloc] initWithItem:wself.rect snapToPoint:tapPoint];
        [wself.animator addBehavior:wself.snap];
    };
}

- (void)restoreState
{
    [self.animator removeAllBehaviors];
    self.snap = [[UISnapBehavior alloc] initWithItem:self.rect snapToPoint:self.view.center];
    [self.animator addBehavior:self.snap];
}
@end
