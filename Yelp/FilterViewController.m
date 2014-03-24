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

#define SORT_BY_ITEMS @[@"Best Match", @"Distance", @"Rating"]
#define DISTANCE_ITEMS @[@"Auto", @"2 blocks", @"6 blocks", @"1 mile", @"5 miles"]
#define DISTANCE_METERS @[[NSNull null], @190, @570, @1609, @8047]

@interface FilterViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) BOOL sortByExpanded;
@property (nonatomic, assign) BOOL distanceExpanded;
@property (nonatomic, assign) NSInteger distanceMode;

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
}

- (void)cancelClick {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchClick {
    [self.delegate filterViewControllerSearchClick:self];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)distanceFilterInMeters {
    if (self.distanceMode == 0) {
        return 0;
    } else {
        return [DISTANCE_METERS[self.distanceMode] integerValue];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
        case 0:
            return self.sortByExpanded ? 3 : 1;
        case 1:
            return self.distanceExpanded ? 5 : 1;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            return [self cellForExpandingSection:indexPath tableView:tableView expandedItems:SORT_BY_ITEMS expanded:self.sortByExpanded currentValue:self.sortMode];
        }
        case 1: {
            return [self cellForExpandingSection:indexPath tableView:tableView expandedItems:DISTANCE_ITEMS expanded:self.distanceExpanded currentValue:self.distanceMode];
        }
        default:
            break;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)didSelectRowInExpandingSection:(NSIndexPath *)indexPath expanded:(BOOL)expanded itemsInSection:(NSInteger)itemsInSection section:(NSInteger)section {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        self.sortByExpanded = !self.sortByExpanded;
        if (!self.sortByExpanded) {
            self.sortMode = indexPath.row;
        }
        [self didSelectRowInExpandingSection:indexPath expanded:self.sortByExpanded itemsInSection:SORT_BY_ITEMS.count section:0];
    } else if (indexPath.section == 1) {
        self.distanceExpanded = !self.distanceExpanded;
        if (!self.distanceExpanded) {
            self.distanceMode = indexPath.row;
        }
        [self didSelectRowInExpandingSection:indexPath expanded:self.distanceExpanded itemsInSection:DISTANCE_ITEMS.count section:1];
    }
}

@end
