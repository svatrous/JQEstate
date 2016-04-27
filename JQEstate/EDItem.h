//
//  EDItem.h
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDItem : NSObject

@property (copy, nonatomic, readonly) NSNumber *id;

@property (copy, nonatomic, readonly) NSString *updatedAt;

@property (copy, nonatomic, readonly) NSDictionary *communication;

@property (copy, nonatomic, readonly) NSDictionary *location;

@property (copy, nonatomic, readonly) NSString *state;

@property (copy, nonatomic, readonly) NSDictionary *saleOffer;

@property (copy, nonatomic, readonly) NSArray *linkedContactIds;

@property (copy, nonatomic, readonly) NSDictionary *additionalDetails;

@property (copy, nonatomic, readonly) NSDictionary *responsibleUser;

@property (copy, nonatomic, readonly) NSNumber *createdByUserId;

@property (copy, nonatomic, readonly) NSArray *layoutImages;

@property (copy, nonatomic, readonly) NSArray *zipalPackageIds;

@property (copy, nonatomic, readonly) NSNumber *updatedByUserId;

@property (copy, nonatomic, readonly) NSString *createdAt;

@property (copy, nonatomic, readonly) NSString *category;

@property (copy, nonatomic, readonly) NSArray *equipment;

@property (copy, nonatomic, readonly) NSString *kind;

@property (copy, nonatomic, readonly) NSArray *images;

@property (copy, nonatomic, readonly) NSArray *specification;

@property (copy, nonatomic, readonly) NSDictionary *landDetails;

@property (copy, nonatomic, readonly) NSNumber *clientLeadId;

@property (copy, nonatomic, readonly) NSDictionary *rentOffer;

- (instancetype) initWithJson: (NSDictionary *) json;

@end
