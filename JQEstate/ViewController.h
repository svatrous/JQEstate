//
//  ViewController.h
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void) reloadTableView;

@end

