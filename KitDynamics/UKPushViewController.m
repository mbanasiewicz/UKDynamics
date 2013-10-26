//
//  UKPushViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKPushViewController.h"

@implementation UKPushViewController

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
    // 1. Stworzenie obiektu zachowania popychania z trybem natychmiastowego przśpieszenia
//    self.push = [[UIPushBehavior alloc] initWithItems:@[self.rect] mode:UIPushBehaviorModeInstantaneous];
    
    // 2. Stworzenie obiektu zachowania popychania z trybem ciągłego przśpieszenia
//    self.push = [[UIPushBehavior alloc] initWithItems:@[self.rect] mode:UIPushBehaviorModeContinuous];

    // 3. Zdefiniowanie nowego wektora siły
//    [self.push setPushDirection:CGVectorMake(0.0f, -.5f)];
    
    // 4. Dodanie do animatora
//    [self.animator addBehavior:self.push];
    
    // 5. Zmiana punktu przyłożenia siły
//    [self.push setTargetOffsetFromCenter:UIOffsetMake(10.0f, 10.0f)
//                                 forItem:self.rect];
    
    // 6. Zwiększenie gęstości
//    UIDynamicItemBehavior *densityBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.rect]];
//    densityBehavior.density = 12.0;
//    [self.animator addBehavior:densityBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareView
{
    self.navigationItem.rightBarButtonItem = nil;
    // Stworzenie animatora
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // Stworzenie kwadratu
    self.anchorPoint = CGPointMake(160.0f, self.view.frame.size.height - 50.0f);
    self.rect = [self createRectWithCenter:self.anchorPoint];
    [self.view addSubview:self.rect];
    
}
@end
