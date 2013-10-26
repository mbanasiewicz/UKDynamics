//
//  UKGravityWithCollisionViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKGravityWithCollisionViewController.h"

@interface UKGravityWithCollisionViewController ()

@end

@implementation UKGravityWithCollisionViewController

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
    
    // 1. Utworzenie zachowania kolizji z utworzonym kwadratem
//    self.collision = [[UICollisionBehavior alloc] initWithItems:@[self.rect]];
    
    // 2. Dodanie kolizji do animatora
//    [self.animator addBehavior:self.collision];
    
    // 3. Dodanie krawędzi do kolizji
//    self.collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 4. Dodanie krawędzi drugi sposób
//    self.collisionEdgeInsets = UIEdgeInsetsMake(0.0f, 0.0f, 50.0f, 0.0f);
//    [self.collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:self.collisionEdgeInsets];
    
    // 5. Dodawanie barier przy pomocy punktów
//    CGFloat yOffset = 400.0f;
//    [self.collision addBoundaryWithIdentifier:@"bariera"
//                                    fromPoint:CGPointMake(0.0f, yOffset)
//                                      toPoint:CGPointMake(self.view.bounds.size.width, yOffset)];
    // 6. Tryby pracy grawitacji
    // 6.1 Tryb zderzeń tylko dla widoków
//    self.collision.collisionMode = UICollisionBehaviorModeItems;
    
    // 6.2 Tryb zderzeń tylko z krawędziami
//    self.collision.collisionMode = UICollisionBehaviorModeBoundaries;
    
    // 6.3 Tryb domyślny
//    self.collision.collisionMode = UICollisionBehaviorModeEverything;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareView
{
    self.collisionEdgeInsets = UIEdgeInsetsZero;
    self.rect = [self createRect];
    [self.view addSubview:self.rect];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravity = [[UIGravityBehavior alloc] initWithItems:@[self.rect]];
    [self.gravity setGravityDirection:CGVectorMake(0.0f, 1.0f)];
    [self.animator addBehavior:self.gravity];
}


#pragma mark Restore state
- (void)restoreState
{
    for (id<UIDynamicItem> item in self.collision.items)
    {
        [self.collision removeItem:item];
        [self.gravity removeItem:item];
    
    }
    for (UIView *view in self.view.subviews)
    {
        if (![view isEqual:self.rect])
        {
            [view removeFromSuperview];
        }
    }
    self.collisionEdgeInsets = self.collisionEdgeInsets;
    [self.animator removeBehavior:self.gravity];
    [self.animator removeBehavior:self.collision];
    [self.rect setFrame:self.originalRectFrame];
    
    [self.gravity addItem:self.rect];
    [self.collision addItem:self.rect];
    
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
}
@end
