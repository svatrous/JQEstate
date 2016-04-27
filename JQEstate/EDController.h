//
//  EDController.h
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface EDController : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) ViewController *view;

- (void) updateItems;

@end
