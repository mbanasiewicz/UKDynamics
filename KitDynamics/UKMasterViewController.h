//
//  UKMasterViewController.h
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 25.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UKDetailViewController;

@interface UKMasterViewController : UITableViewController

@property (strong, nonatomic) UKDetailViewController *detailViewController;

@end
