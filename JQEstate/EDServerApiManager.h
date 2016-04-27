//
//  EDServerApiManager.h
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDItem;
@interface EDServerApiManager : NSObject

+ (EDServerApiManager *) shared;

- (void) updateItems;

- (NSInteger) getItemsCount;

- (EDItem *) getItemForIndex: (NSInteger) index;

@end
