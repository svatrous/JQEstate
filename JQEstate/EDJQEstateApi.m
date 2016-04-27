//
//  EDJQEstateApi.m
//  JQEstate
//
//  Created by Паша on 26.04.16.
//  Copyright © 2016 EarthquakeDev. All rights reserved.
//

#import "EDJQEstateApi.h"
#import <AFNetworking.h>

@interface EDJQEstateApi ()

@property (strong, nonatomic) AFHTTPSessionManager *httpManager;

@end

@implementation EDJQEstateApi

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
        self.httpManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.jqestate.ru/v1/"]];
        
    }
    
    return self;
}


- (void) getItemsWithCount: (unsigned int) count
                    offset: (unsigned int) offset
                   success: (void (^)(NSArray *result)) success
                   failure: (void (^)(NSError *error)) failure {
    
    [self.httpManager GET:@"properties/country"
               parameters:@{@"pagination[offset]": @(offset),
                            @"pagination[count]": @(count),
                            @"filter[saleOffer.price]":@(2000000)}
                 progress:nil
                  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                      
                      if (success) {
                          success(responseObject[@"items"]);
                      }
                      
                }
                  failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                      
                      if (failure) {
                          failure(error);
                      }
                      
                }];
    
}
@end
