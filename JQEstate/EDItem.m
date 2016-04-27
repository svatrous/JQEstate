//
//  EDItem.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDItem.h"

@interface EDItem ()

@property (copy, nonatomic) NSNumber *id;

@property (copy, nonatomic) NSString *updatedAt;

@property (copy, nonatomic) NSDictionary *communication;

@property (copy, nonatomic) NSDictionary *location;

@property (copy, nonatomic) NSString *state;

@property (copy, nonatomic) NSDictionary *saleOffer;

@property (copy, nonatomic) NSArray *linkedContactIds;

@property (copy, nonatomic) NSDictionary *additionalDetails;

@property (copy, nonatomic) NSDictionary *responsibleUser;

@property (copy, nonatomic) NSNumber *createdByUserId;

@property (copy, nonatomic) NSArray *layoutImages;

@property (copy, nonatomic) NSArray *zipalPackageIds;

@property (copy, nonatomic) NSNumber *updatedByUserId;

@property (copy, nonatomic) NSString *createdAt;

@property (copy, nonatomic) NSString *category;

@property (copy, nonatomic) NSArray *equipment;

@property (copy, nonatomic) NSString *kind;

@property (copy, nonatomic) NSArray *images;

@property (copy, nonatomic) NSDictionary *landDetails;

@property (copy, nonatomic) NSArray *specification;

@property (copy, nonatomic) NSNumber *clientLeadId;

@property (copy, nonatomic) NSDictionary *rentOffer;

@end

@implementation EDItem


- (instancetype) initWithJson: (NSDictionary *) json {
    
    self = [super init];
    
    if (self) {
        
        [self setValuesForKeysWithDictionary:json];
        
    }
    
    return self;
    
}


@end
