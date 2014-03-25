//
//  FilterViewController.m
//  Yelp
//
//  Created by Liron Yahdav on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FilterViewController.h"
#import "DropDownCell.h"
#import "RadioSelectionCell.h"
#import "SwitchCell.h"
#import "RestaurantCategory.h"
#import "SeeAllCell.h"

#define SORT_BY_ITEMS @[@"Best Match", @"Distance", @"Rating"]
#define DISTANCE_ITEMS @[@"Auto", @"2 blocks", @"6 blocks", @"1 mile", @"5 miles"]

const int kMostPopularSection = 0;
const int kDistanceFilterSection = 1;
const int kSortBySection = 2;
const int kCategoriesSection = 3;

const int kCategoriesSubsetCount = 5;

@interface FilterViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL sortByExpanded;
@property (nonatomic, assign) BOOL distanceExpanded;
@property (nonatomic, assign) BOOL categoriesExpanded;

@end

@implementation FilterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Filter";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStyleBordered target:self action:@selector(searchClick)];

    UINib *dropDownCell = [UINib nibWithNibName:@"DropDownCell" bundle:nil];
    [self.tableView registerNib:dropDownCell forCellReuseIdentifier:@"DropDownCell"];
    UINib *radioSelectionCell = [UINib nibWithNibName:@"RadioSelectionCell" bundle:nil];
    [self.tableView registerNib:radioSelectionCell forCellReuseIdentifier:@"RadioSelectionCell"];
    UINib *switchCell = [UINib nibWithNibName:@"SwitchCell" bundle:nil];
    [self.tableView registerNib:switchCell forCellReuseIdentifier:@"SwitchCell"];
    UINib *seeAllCell = [UINib nibWithNibName:@"SeeAllCell" bundle:nil];
    [self.tableView registerNib:seeAllCell forCellReuseIdentifier:@"SeeAllCell"];
}

- (void)cancelClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchClick {
    [self.delegate filterViewControllerSearchClick:self.filter];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
        case kMostPopularSection:
            return 1;
        case kSortBySection:
            return self.sortByExpanded ? 3 : 1;
        case kDistanceFilterSection:
            return self.distanceExpanded ? 5 : 1;
        case kCategoriesSection:
            return self.categoriesExpanded ? self.filter.categories.count : kCategoriesSubsetCount + 1;
    }
    
    return 0;
}

- (UITableViewCell *)cellForExpandingSection:(NSIndexPath *)indexPath tableView:(UITableView *)tableView expandedItems:(NSArray *)items expanded:(BOOL)expanded currentValue:(NSInteger)value {
    if (expanded) {
        RadioSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RadioSelectionCell" forIndexPath:indexPath];
        cell.label.text = items[indexPath.row];
        cell.checked = indexPath.row == value;
        return cell;
    } else {
        DropDownCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DropDownCell" forIndexPath:indexPath];
        cell.label.text = items[value];
        return cell;
    }
}

- (SwitchCell *)restaurantCategoryCellForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell" forIndexPath:indexPath];
    RestaurantCategory *category = self.filter.categories[indexPath.row];
    cell.onOffSwitch.on = category.on;
    cell.label.text = category.name;
    __weak SwitchCell *weakCell = cell;
    cell.switchValueChangedBlock = ^(BOOL value){
        category.on = weakCell.onOffSwitch.on;
    };
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case kMostPopularSection: {
            SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell" forIndexPath:indexPath];
            cell.onOffSwitch.on = self.filter.dealsFiltered;
            cell.label.text = @"Offering a Deal";
            __weak SwitchCell *weakCell = cell;
            cell.switchValueChangedBlock = ^(BOOL value){
                self.filter.dealsFiltered = weakCell.onOffSwitch.on;
            };
            return cell;
        }
        case kSortBySection: {
            return [self cellForExpandingSection:indexPath tableView:tableView expandedItems:SORT_BY_ITEMS expanded:self.sortByExpanded currentValue:self.filter.sortMode];
        }
        case kDistanceFilterSection: {
            return [self cellForExpandingSection:indexPath tableView:tableView expandedItems:DISTANCE_ITEMS expanded:self.distanceExpanded currentValue:self.filter.distanceMode];
        }
        case kCategoriesSection: {
            if (self.categoriesExpanded) {
                return [self restaurantCategoryCellForIndexPath:indexPath tableView:tableView];
            } else {
                if (indexPath.row >= kCategoriesSubsetCount) {
                    return [tableView dequeueReusableCellWithIdentifier:@"SeeAllCell" forIndexPath:indexPath];
                } else {
                    return [self restaurantCategoryCellForIndexPath:indexPath tableView:tableView];
                }
            }
        }
        default:
            break;
    }
    
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case kMostPopularSection:
            return @"Most Popular";
        case kSortBySection:
            return @"Sort by";
        case kDistanceFilterSection:
            return @"Distance";
        case kCategoriesSection:
            return @"Categories";
        default:
            return nil;
    }
}

#pragma mark - UITableViewDelegate

- (void)didSelectRowInExpandingSection:(NSInteger)section expanded:(BOOL)expanded itemsInSection:(NSInteger)itemsInSection {
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSInteger i=0; i<itemsInSection; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    if (expanded) {
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView deleteRowsAtIndexPaths:@[indexPaths.firstObject] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    } else {
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[indexPaths.firstObject] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
    }
}

- (void)didSelectSeeAllRow:(NSIndexPath *)indexPath itemsInSection:(NSInteger)itemsInSection subsetCount:(NSInteger)subsetCount section:(NSInteger)section {
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSInteger i=subsetCount; i < itemsInSection; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch(indexPath.section) {
        case kSortBySection: {
            self.sortByExpanded = !self.sortByExpanded;
            if (!self.sortByExpanded) {
                self.filter.sortMode = indexPath.row;
            }
            [self didSelectRowInExpandingSection:kSortBySection expanded:self.sortByExpanded itemsInSection:SORT_BY_ITEMS.count];
            break;
        }
        case kDistanceFilterSection: {
            self.distanceExpanded = !self.distanceExpanded;
            if (!self.distanceExpanded) {
                self.filter.distanceMode = indexPath.row;
            }
            [self didSelectRowInExpandingSection:kDistanceFilterSection expanded:self.distanceExpanded itemsInSection:DISTANCE_ITEMS.count];
            break;
        }
        case kCategoriesSection: {
            if (!self.categoriesExpanded && indexPath.row == kCategoriesSubsetCount) {
                self.categoriesExpanded = YES;
                [self didSelectSeeAllRow:indexPath itemsInSection:self.filter.categories.count subsetCount:kCategoriesSubsetCount section:kCategoriesSection];
            }
            break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
