//
//  EDServerApiManager.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDServerApiManager.h"
#import "EDJQEstateApi.h"
#import "EDNotificationKeys.h"
#import "EDItem.h"

static int pageItemsCount = 15;

@interface EDServerApiManager ()

@property (strong, nonatomic) EDJQEstateApi *api;

@property (copy, nonatomic) NSArray *items;

@end

@implementation EDServerApiManager

+ (EDServerApiManager *) shared {
    
    static EDServerApiManager *singleton = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        singleton = [[EDServerApiManager alloc] init];
        
        singleton.api = [[EDJQEstateApi alloc] init];
        
        singleton.items = [NSArray new];
        
    });
    
    return singleton;
    
}

- (void) updateItems {
    
    [self.api getItemsWithCount:pageItemsCount offset:(unsigned int)self.items.count success:^(NSArray *result) {
        
        if ([result count]==0) {
            
            [[NSNotificationCenter defaultCenter] postNotificationName:kJQEstateNotificationKeyItemsUpdateWasFailured object:self];
            
            return;
        }
        
        NSMutableArray *parsedObjects = [NSMutableArray new];
        
        for (NSDictionary *item in result) {
            
            [parsedObjects addObject:[[EDItem alloc] initWithJson:item]];
            
        }
        
        NSMutableArray *itemsArrayCopy = [self.items mutableCopy];
        
        [itemsArrayCopy addObjectsFromArray:parsedObjects];
        
        self.items = itemsArrayCopy;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kJQEstateNotificationKeyItemsWasUpdate object:self];
        
    } failure:^(NSError *error) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kJQEstateNotificationKeyItemsUpdateWasFailured object:self];
        
        NSLog(@"%@", error);
        
    }];
    
}

- (NSInteger) getItemsCount {
    
    return [self.items count];
    
}

- (EDItem *) getItemForIndex: (NSInteger) index {
    
    if ([self.items count]<=index) {
        return nil;
    }
    
    return self.items[index];
    
}

@end
