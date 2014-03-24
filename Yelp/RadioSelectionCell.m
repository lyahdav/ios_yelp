//
//  RadioSelectionCell.m
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RadioSelectionCell.h"

@interface RadioSelectionCell ()

@property (weak, nonatomic) IBOutlet UIView *boxView;

@end

@implementation RadioSelectionCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChecked:(BOOL)checked {
    _checked = checked;
    self.accessoryType = checked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    self.boxView.hidden = checked;
}

@end
