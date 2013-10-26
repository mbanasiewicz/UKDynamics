//
//  UKGravityViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKGravityViewController.h"

@interface UKGravityViewController ()

@end

@implementation UKGravityViewController

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
    
    // 1. Tworzenie kwadratu i dodawanie go do tego widoku
    self.rect = [self createRect];
    [self.view addSubview:self.rect];
    
    // 2. Tworzenie obiektu animatora z widokiem odniesienia
    //    Każdy z kontrolerów ma zdefiniowaną własność animatora
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 3. Tworzenie obiektu odpowiadającego za grawitację
    //    oraz przypisanie do niego kwadratu z punktu 1
//    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.rect]];
    
    // 4. Dodanie zachowania do animatora
//    [self.animator addBehavior:self.gravity];
    
    // 5. Utworzenie nowego wektora grawitacji i jego podmiana
//    CGVector newGravityVector = CGVectorMake(0.0f, 1.0f);
//    [self.gravity setGravityDirection:newGravityVector];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Restore state
- (void)restoreState
{
    [self.animator removeBehavior:self.gravity];
    [self.rect setFrame:self.originalRectFrame];
    [self.animator addBehavior:self.gravity];
}
@end
