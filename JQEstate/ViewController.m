//
//  ViewController.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "ViewController.h"
#import "EDController.h"

@interface ViewController ()

@property (strong, nonatomic) EDController *controller;

@end

@implementation ViewController

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        self.controller = [[EDController alloc] init];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.controller.view = self;
    
    [self.tableView setDataSource:self.controller];
    
    [self.tableView setDelegate:self.controller];
    
    [self.controller updateItems];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void) reloadTableView {
    
    [self.tableView reloadData];
    
}


@end
