//
//  EDJQEstateApi.h
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDJQEstateApi : NSObject

- (void) getItemsWithCount: (unsigned int) count
                    offset: (unsigned int) offset
                   success: (void (^)(NSArray *result)) success
                   failure: (void (^)(NSError *error)) failure;

@end
