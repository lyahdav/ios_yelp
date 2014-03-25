//
//  FilterViewController.h
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestaurantsFilter.h"

@class FilterViewController;

@protocol FilterViewControllerDelegate <NSObject>

- (void)filterViewControllerSearchClick:(RestaurantsFilter *)filter;

@end

@interface FilterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RestaurantsFilter *filter;
@property (nonatomic, weak) id<FilterViewControllerDelegate> delegate;

@end
