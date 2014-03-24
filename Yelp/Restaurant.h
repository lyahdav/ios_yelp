//
//  Restaurant.h
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

+ (NSArray *)restaurantsFromJSON:(NSArray *)jsonArray;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *imageURL;

@end
