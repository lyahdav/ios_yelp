//
//  Restaurant.m
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "Restaurant.h"

const CGFloat kMetersPerMile = 1609.34;

@implementation Restaurant

+ (NSArray *)restaurantsFromJSON:(NSArray *)jsonArray {
    NSMutableArray *restaurants = [[NSMutableArray alloc] init];
    
    for(NSDictionary *restaurantDictionary in jsonArray) {
        Restaurant *restaurant = [[Restaurant alloc] initWithDictionary:restaurantDictionary];
        [restaurants addObject:restaurant];
    }
    
    return restaurants;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        NSArray *displayAddress = dictionary[@"location"][@"display_address"];
        if (displayAddress.count == 4) {
            self.address = [NSString stringWithFormat:@"%@, %@", displayAddress[0], displayAddress[2]];
        } else {
            self.address = displayAddress[0];
        }
        self.imageURL = dictionary[@"image_url"];
        self.ratingImageURL = dictionary[@"rating_img_url"];
    }
    
    return self;
}

@end
