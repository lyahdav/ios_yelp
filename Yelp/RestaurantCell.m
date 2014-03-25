//
//  RestaurantCell.m
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RestaurantCell.h"
#import "UIImageView+AFNetworking.h"

@interface RestaurantCell ()
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImage;
@property (weak, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation RestaurantCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)restaurantLabelTextForRestaurant:(Restaurant *)restaurant atRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld. %@", (long)row + 1, restaurant.name];
}

- (void)setRestaurant:(Restaurant *)restaurant {
    _restaurant = restaurant;
    
    self.restaurantNameLabel.text = [RestaurantCell restaurantLabelTextForRestaurant:restaurant atRow:self.rowNumber];
    [self.previewImage setImageWithURL:[NSURL URLWithString:restaurant.imageURL]];
    [self.ratingImage setImageWithURL:[NSURL URLWithString:restaurant.ratingImageURL]];
    self.addressLabel.text = restaurant.address;
}

- (CGFloat)heightForRestaurant:(Restaurant *)restaurant atRow:(NSInteger)row {
    self.restaurantNameLabel.text = [RestaurantCell restaurantLabelTextForRestaurant:restaurant atRow:row];

    CGSize constraint = CGSizeMake(self.restaurantNameLabel.frame.size.width, CGFLOAT_MAX);
    CGFloat newRestaurantLabelHeight = [self.restaurantNameLabel sizeThatFits:constraint].height;
    CGFloat originalRestaurantLabelHeight = self.restaurantNameLabel.frame.size.height;
    CGFloat height = self.frame.size.height - originalRestaurantLabelHeight + newRestaurantLabelHeight;
    return height;
}

@end
