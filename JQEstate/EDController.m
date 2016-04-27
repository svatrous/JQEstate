//
//  EDController.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDController.h"
#import "EDServerApiManager.h"
#import "EDNotificationKeys.h"
#import "EDServerApiManager.h"
#import "EDMainTableViewCell.h"

@interface EDController () {
    
    BOOL dataIsEnding;
    
}

@end

@implementation EDController

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(needToUpdateTableView:) name:kJQEstateNotificationKeyItemsWasUpdate object:nil];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(itemsUpdateWasFailured:) name:kJQEstateNotificationKeyItemsUpdateWasFailured object:nil];
    }
    
    return self;
    
}

- (void) updateItems {
    
    [[EDServerApiManager shared] updateItems];
    
}

- (void) needToUpdateTableView: (NSNotification *) notification {
    
    [self.view reloadTableView];
    
}

- (void) itemsUpdateWasFailured: (NSNotification *) notification {
    
    dataIsEnding = YES;
    
    [self.view.tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[EDServerApiManager shared] getItemsCount];
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EDMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    
    [cell setItem:[[EDServerApiManager shared] getItemForIndex:indexPath.row]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==[[EDServerApiManager shared] getItemsCount]-1) {
         [[EDServerApiManager shared] updateItems];
    }
    
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (!dataIsEnding) {
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.hidesWhenStopped = YES;
        [spinner startAnimating];
        spinner.frame = CGRectMake(0, 0, self.view.view.frame.size.width, 44);
        return spinner;
        
    } else
        
        dataIsEnding = NO;
        
        return nil;

}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 44.0f;
}


@end
