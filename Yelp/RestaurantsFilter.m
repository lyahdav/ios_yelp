//
//  RestaurantsFilter.m
//  Yelp
//
//  Created by Liron Yahdav on 3/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RestaurantsFilter.h"
#import "RestaurantCategory.h"

#define DISTANCE_METERS @[[NSNull null], @190, @570, @1609, @8047] // assumes average city block is 190 meters

@implementation RestaurantsFilter

- (id)init {
    self = [super init];
    if (self) {
        self.categories = [RestaurantCategory allCategories];
    }
    return self;
}

- (NSInteger)distanceFilterInMeters {
    if (self.distanceMode == 0) {
        return 0;
    } else {
        return [DISTANCE_METERS[self.distanceMode] integerValue];
    }
}

@end
