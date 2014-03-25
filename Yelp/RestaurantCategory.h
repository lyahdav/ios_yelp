//
//  RestaurantCategory.h
//  Yelp
//
//  Created by Liron Yahdav on 3/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantCategory : NSObject

+ (NSArray *)allCategories;

@property (nonatomic, assign) BOOL on;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *identifier;

@end
