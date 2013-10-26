//
//  UKGravityWithCollisionAndPropertiesViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKGravityWithCollisionAndPropertiesViewController.h"

@interface UKGravityWithCollisionAndPropertiesViewController ()
@property (nonatomic, strong) UIView *leftRect;
@property (nonatomic, strong) UIView *rightRect;

@property (nonatomic, assign) CGRect leftRectOriginalFrame;
@property (nonatomic, assign) CGRect rightRectOriginalFrame;

@property (nonatomic, strong) UIDynamicItemBehavior *leftItemBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *rightItemBehavior;
@end

@implementation UKGravityWithCollisionAndPropertiesViewController

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
    // 1. Utworzenie obiektów UIDynamicItemBehavior dla lewego i prawego kwadratu
//    self.leftItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.leftRect]];
//    self.rightItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.rightRect]];

    // 2. Dodanie obiektów utworzonych w pkt. 1 do animatora
//    [self.animator addBehavior:self.leftItemBehavior];
//    [self.animator addBehavior:self.rightItemBehavior];
    
    // 3. Zmodyfikowanie własności elastyczności dla prawego kwadratu
    //    Wartości pomiędzy 0.0 a 1.0, 0 oznacza brak elastyczności
//    self.rightItemBehavior.elasticity = 1.0f;
    
    // 4. Zmodyfikowanie własności oporu jaki stawia prawy kwadrat podczas przemieszczania się
    //    Wartości pomiędzy 0.0 a 1.0, 0 oznacza brak oporów
//    self.rightItemBehavior.resistance = 0.0f;
    
    // 5. Dodanie prędkość kątowej obrotu elementu
    //    W radianach na sekundę
//    [self.leftItemBehavior addAngularVelocity:4.0f forItem:self.leftRect];
    
    // 6. Dodanie prędkości przemieszczania się elementu
    //    W punktach na sekundę
//    [self.leftItemBehavior addLinearVelocity:self.view.center forItem:self.leftRect];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareView
{
    // Stworzenie 2 kwadratów
    self.leftRect = [self createRectWithCenter:[self leftHalf]];
    self.rightRect = [self createRectWithCenter:[self rightHalf]];
    [self.view addSubview:self.leftRect];
    [self.view addSubview:self.rightRect];
    
    // Zapamętanie ich frame'ów
    self.rightRectOriginalFrame = self.rightRect.frame;
    self.leftRectOriginalFrame = self.leftRect.frame;
    
    // Ustawienie UIKitDynamics
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.leftRect, self.rightRect]];
    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.leftRect, self.rightRect]];
    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
}

#pragma mark Restore state
- (void)restoreState
{
    [self.animator removeAllBehaviors];
    [self.leftRect setFrame:self.leftRectOriginalFrame];
    [self.rightRect setFrame:self.rightRectOriginalFrame];
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
    [self.animator addBehavior:self.leftItemBehavior];
    [self.animator addBehavior:self.rightItemBehavior];
}

@end
