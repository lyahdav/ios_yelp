//
//  RestaurantCell.h
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Restaurant.h"

@interface RestaurantCell : UITableViewCell

@property (nonatomic, weak) Restaurant *restaurant;

- (CGFloat)heightForRestaurant:(Restaurant *)restaurant;

@end
