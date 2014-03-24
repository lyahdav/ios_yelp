//
//  RadioSelectionCell.h
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioSelectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, assign) BOOL checked;

@end
