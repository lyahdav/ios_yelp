//
//  FilterViewController.h
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@protocol FilterViewControllerDelegate <NSObject>

- (void)filterViewControllerSearchClick:(FilterViewController *)fvc;

@end

@interface FilterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger sortMode;
@property (nonatomic, readonly) NSInteger distanceFilterInMeters;
@property (nonatomic, assign) BOOL dealsFilter;
@property (nonatomic, weak) id<FilterViewControllerDelegate> delegate;

@end
