//
//  RestaurantsFilter.h
//  Yelp
//
//  Created by Liron Yahdav on 3/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantsFilter : NSObject

@property (nonatomic, assign) NSInteger sortMode;
@property (nonatomic, assign) NSInteger distanceMode;
@property (nonatomic, readonly) NSInteger distanceFilterInMeters;
@property (nonatomic, assign) BOOL dealsFiltered;
@property (nonatomic, strong) NSArray *categories;

@end
