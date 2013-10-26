//
//  UKMasterViewController.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKMasterViewController.h"
#import "UKGravityWithCollisionViewController.h"

@interface UKMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation UKMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _objects = [NSMutableArray array];
    [_objects addObjectsFromArray:[self makeTableViewItems]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Utils
- (NSArray *)makeTableViewItems
{
    return [NSArray arrayWithObjects:@{@"name":@"Grawitacja", @"segue":@"showGravity"},
                                     @{@"name":@"Grawitacja + Kolizje", @"segue": @"showGravityAndCollisions"},
                                     @{@"name":@"Grawitacja + Kolizje + Dynamiczne własności", @"segue": @"showGravityWithCollisionsAndProperties"},
                                     @{@"name":@"Łączenie widoków z punktem", @"segue": @"showAttachmentToPoint"},
                                     @{@"name":@"Przyciąganie do punktu", @"segue": @"showSnap"},
                                     @{@"name":@"Popychanie", @"segue": @"showPush"},
                                     nil];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *object = _objects[indexPath.row];
    cell.textLabel.text = [object valueForKey:@"name"];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *object = _objects[indexPath.row];
    [self performSegueWithIdentifier:[object valueForKey:@"segue"] sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showGravityAndCollisions"]) {
        UKGravityWithCollisionViewController *destination = [segue destinationViewController];
        destination.showsAddRectButton = YES;
    }
}

@end
