#import "RestaurantListViewController.h"
#import "YelpClient.h"
#import "RestaurantCell.h"
#import "Restaurant.h"
#import "RestaurantCategory.h"
#import "RestaurantsFilter.h"

NSString * const kYelpConsumerKey = @"_FOB8mCj9pB2GHrF_jturw";
NSString * const kYelpConsumerSecret = @"0CyrQxEAbviP7b8M2bZR0kKAnFc";
NSString * const kYelpToken = @"OdWcxyr4flepNYt8OxMxJdS8Ib6BFfiM";
NSString * const kYelpTokenSecret = @"QLlnnY3hdFEK05I-yfRVtmilBBQ";

@interface RestaurantListViewController ()

@property (nonatomic, strong) YelpClient *client;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *restaurants;
@property (nonatomic, strong) RestaurantCell *prototypeCell;
@property (nonatomic, strong) NSMutableDictionary *searchParams;
@property (nonatomic, strong) RestaurantsFilter *filter;

@end

@implementation RestaurantListViewController

- (void)performSearch:(NSString *)searchTerm {
    self.searchParams[@"term"] = searchTerm;
    [self performSearch];
}

- (void)performSearch {
    [self.client searchWithParams:self.searchParams success:^(AFHTTPRequestOperation *operation, id response) {
        self.restaurants = [Restaurant restaurantsFromJSON:response[@"businesses"]];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSAssert(NO, @"error: %@", [error description]);
    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *restaurantCell = [UINib nibWithNibName:@"RestaurantCell" bundle:nil];
    [self.tableView registerNib:restaurantCell forCellReuseIdentifier:@"RestaurantCell"];

    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleBordered target:self action:@selector(filterClick)];
    
    self.searchParams = [@{@"location" : @"San Francisco"} mutableCopy];
    
    self.filter = [[RestaurantsFilter alloc] init];
}

- (void)filterClick {
    FilterViewController *vc = [[FilterViewController alloc] init];
    vc.filter = self.filter;
    vc.delegate = self;
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:nc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.restaurants.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    cell.rowNumber = indexPath.row;
    cell.restaurant = self.restaurants[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (RestaurantCell *)prototypeCell {
    if (!_prototypeCell) {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"RestaurantCell"];
    }
    return _prototypeCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.prototypeCell heightForRestaurant:self.restaurants[indexPath.row] atRow:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performSearch:searchBar.text];
    [searchBar resignFirstResponder];
}

#pragma mark - FilterViewControllerDelegate

- (void)filterViewControllerSearchClick:(RestaurantsFilter *)filter {
    // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
    
    self.searchParams[@"sort"] = @(filter.sortMode);
    if (filter.distanceFilterInMeters) {
        self.searchParams[@"radius_filter"] = @(filter.distanceFilterInMeters);
    } else {
        [self.searchParams removeObjectForKey:@"radius_filter"];
    }
    self.searchParams[@"deals_filter"] = @(filter.dealsFiltered);
    
    NSMutableArray *filteredCategories = [[NSMutableArray alloc] init];
    for(RestaurantCategory *category in filter.categories) {
        if (category.on) {
            [filteredCategories addObject:category.identifier];
        }
    }
    self.searchParams[@"category_filter"] = [filteredCategories componentsJoinedByString:@","];

    [self performSearch];
}

@end
