//
//  RestaurantCategory.m
//  Yelp
//
//  Created by Liron Yahdav on 3/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RestaurantCategory.h"

@implementation RestaurantCategory

+ (NSArray *)allCategories {
    NSArray* categories = [[NSMutableArray alloc] init];
    categories = @[
                   [[RestaurantCategory alloc] initWithName:@"Afghan" identifier:@"afghani"],
                   [[RestaurantCategory alloc] initWithName:@"African" identifier:@"african"],
                   [[RestaurantCategory alloc] initWithName:@"Senegalese" identifier:@"senegalese"],
                   [[RestaurantCategory alloc] initWithName:@"South African" identifier:@"southafrican"],
                   [[RestaurantCategory alloc] initWithName:@"American (New)" identifier:@"newamerican"],
                   [[RestaurantCategory alloc] initWithName:@"American (Traditional)" identifier:@"tradamerican"],
                   [[RestaurantCategory alloc] initWithName:@"Arabian" identifier:@"arabian"],
                   [[RestaurantCategory alloc] initWithName:@"Argentine" identifier:@"argentine"],
                   [[RestaurantCategory alloc] initWithName:@"Armenian" identifier:@"armenian"],
                   [[RestaurantCategory alloc] initWithName:@"Asian Fusion" identifier:@"asianfusion"],
                   [[RestaurantCategory alloc] initWithName:@"Australian" identifier:@"australian"],
                   [[RestaurantCategory alloc] initWithName:@"Austrian" identifier:@"austrian"],
                   [[RestaurantCategory alloc] initWithName:@"Bangladeshi" identifier:@"bangladeshi"],
                   [[RestaurantCategory alloc] initWithName:@"Barbeque" identifier:@"bbq"],
                   [[RestaurantCategory alloc] initWithName:@"Basque" identifier:@"basque"],
                   [[RestaurantCategory alloc] initWithName:@"Belgian" identifier:@"belgian"],
                   [[RestaurantCategory alloc] initWithName:@"Brasseries" identifier:@"brasseries"],
                   [[RestaurantCategory alloc] initWithName:@"Brazilian" identifier:@"brazilian"],
                   [[RestaurantCategory alloc] initWithName:@"Breakfast & Brunch" identifier:@"breakfast_brunch"],
                   [[RestaurantCategory alloc] initWithName:@"British" identifier:@"british"],
                   [[RestaurantCategory alloc] initWithName:@"Buffets" identifier:@"buffets"],
                   [[RestaurantCategory alloc] initWithName:@"Burgers" identifier:@"burgers"],
                   [[RestaurantCategory alloc] initWithName:@"Burmese" identifier:@"burmese"],
                   [[RestaurantCategory alloc] initWithName:@"Cafes" identifier:@"cafes"],
                   [[RestaurantCategory alloc] initWithName:@"Cafeteria" identifier:@"cafeteria"],
                   [[RestaurantCategory alloc] initWithName:@"Cajun/Creole" identifier:@"cajun"],
                   [[RestaurantCategory alloc] initWithName:@"Cambodian" identifier:@"cambodian"],
                   [[RestaurantCategory alloc] initWithName:@"Caribbean" identifier:@"caribbean"],
                   [[RestaurantCategory alloc] initWithName:@"Dominican" identifier:@"dominican"],
                   [[RestaurantCategory alloc] initWithName:@"Haitian" identifier:@"haitian"],
                   [[RestaurantCategory alloc] initWithName:@"Puerto Rican" identifier:@"puertorican"],
                   [[RestaurantCategory alloc] initWithName:@"Trinidadian" identifier:@"trinidadian"],
                   [[RestaurantCategory alloc] initWithName:@"Catalan" identifier:@"catalan"],
                   [[RestaurantCategory alloc] initWithName:@"Cheesesteaks" identifier:@"cheesesteaks"],
                   [[RestaurantCategory alloc] initWithName:@"Chicken Wings" identifier:@"chicken_wings"],
                   [[RestaurantCategory alloc] initWithName:@"Chinese" identifier:@"chinese"],
                   [[RestaurantCategory alloc] initWithName:@"Cantonese" identifier:@"cantonese"],
                   [[RestaurantCategory alloc] initWithName:@"Dim Sum" identifier:@"dimsum"],
                   [[RestaurantCategory alloc] initWithName:@"Shanghainese" identifier:@"shanghainese"],
                   [[RestaurantCategory alloc] initWithName:@"Szechuan" identifier:@"szechuan"],
                   [[RestaurantCategory alloc] initWithName:@"Comfort Food" identifier:@"comfortfood"],
                   [[RestaurantCategory alloc] initWithName:@"Creperies" identifier:@"creperies"],
                   [[RestaurantCategory alloc] initWithName:@"Cuban" identifier:@"cuban"],
                   [[RestaurantCategory alloc] initWithName:@"Czech" identifier:@"czech"],
                   [[RestaurantCategory alloc] initWithName:@"Delis" identifier:@"delis"],
                   [[RestaurantCategory alloc] initWithName:@"Diners" identifier:@"diners"],
                   [[RestaurantCategory alloc] initWithName:@"Ethiopian" identifier:@"ethiopian"],
                   [[RestaurantCategory alloc] initWithName:@"Fast Food" identifier:@"hotdogs"],
                   [[RestaurantCategory alloc] initWithName:@"Filipino" identifier:@"filipino"],
                   [[RestaurantCategory alloc] initWithName:@"Fish & Chips" identifier:@"fishnchips"],
                   [[RestaurantCategory alloc] initWithName:@"Fondue" identifier:@"fondue"],
                   [[RestaurantCategory alloc] initWithName:@"Food Court" identifier:@"food_court"],
                   [[RestaurantCategory alloc] initWithName:@"Food Stands" identifier:@"foodstands"],
                   [[RestaurantCategory alloc] initWithName:@"French" identifier:@"french"],
                   [[RestaurantCategory alloc] initWithName:@"Gastropubs" identifier:@"gastropubs"],
                   [[RestaurantCategory alloc] initWithName:@"German" identifier:@"german"],
                   [[RestaurantCategory alloc] initWithName:@"Gluten-Free" identifier:@"gluten_free"],
                   [[RestaurantCategory alloc] initWithName:@"Greek" identifier:@"greek"],
                   [[RestaurantCategory alloc] initWithName:@"Halal" identifier:@"halal"],
                   [[RestaurantCategory alloc] initWithName:@"Hawaiian" identifier:@"hawaiian"],
                   [[RestaurantCategory alloc] initWithName:@"Himalayan/Nepalese" identifier:@"himalayan"],
                   [[RestaurantCategory alloc] initWithName:@"Hot Dogs" identifier:@"hotdog"],
                   [[RestaurantCategory alloc] initWithName:@"Hot Pot" identifier:@"hotpot"],
                   [[RestaurantCategory alloc] initWithName:@"Hungarian" identifier:@"hungarian"],
                   [[RestaurantCategory alloc] initWithName:@"Iberian" identifier:@"iberian"],
                   [[RestaurantCategory alloc] initWithName:@"Indian" identifier:@"indpak"],
                   [[RestaurantCategory alloc] initWithName:@"Indonesian" identifier:@"indonesian"],
                   [[RestaurantCategory alloc] initWithName:@"Irish" identifier:@"irish"],
                   [[RestaurantCategory alloc] initWithName:@"Italian" identifier:@"italian"],
                   [[RestaurantCategory alloc] initWithName:@"Japanese" identifier:@"japanese"],
                   [[RestaurantCategory alloc] initWithName:@"Korean" identifier:@"korean"],
                   [[RestaurantCategory alloc] initWithName:@"Kosher" identifier:@"kosher"],
                   [[RestaurantCategory alloc] initWithName:@"Laotian" identifier:@"laotian"],
                   [[RestaurantCategory alloc] initWithName:@"Latin American" identifier:@"latin"],
                   [[RestaurantCategory alloc] initWithName:@"Colombian" identifier:@"colombian"],
                   [[RestaurantCategory alloc] initWithName:@"Salvadoran" identifier:@"salvadoran"],
                   [[RestaurantCategory alloc] initWithName:@"Venezuelan" identifier:@"venezuelan"],
                   [[RestaurantCategory alloc] initWithName:@"Live/Raw Food" identifier:@"raw_food"],
                   [[RestaurantCategory alloc] initWithName:@"Malaysian" identifier:@"malaysian"],
                   [[RestaurantCategory alloc] initWithName:@"Mediterranean" identifier:@"mediterranean"],
                   [[RestaurantCategory alloc] initWithName:@"Falafel" identifier:@"falafel"],
                   [[RestaurantCategory alloc] initWithName:@"Mexican" identifier:@"mexican"],
                   [[RestaurantCategory alloc] initWithName:@"Middle Eastern" identifier:@"mideastern"],
                   [[RestaurantCategory alloc] initWithName:@"Egyptian" identifier:@"egyptian"],
                   [[RestaurantCategory alloc] initWithName:@"Lebanese" identifier:@"lebanese"],
                   [[RestaurantCategory alloc] initWithName:@"Modern European" identifier:@"modern_european"],
                   [[RestaurantCategory alloc] initWithName:@"Mongolian" identifier:@"mongolian"],
                   [[RestaurantCategory alloc] initWithName:@"Moroccan" identifier:@"moroccan"],
                   [[RestaurantCategory alloc] initWithName:@"Pakistani" identifier:@"pakistani"],
                   [[RestaurantCategory alloc] initWithName:@"Persian/Iranian" identifier:@"persian"],
                   [[RestaurantCategory alloc] initWithName:@"Peruvian" identifier:@"peruvian"],
                   [[RestaurantCategory alloc] initWithName:@"Pizza" identifier:@"pizza"],
                   [[RestaurantCategory alloc] initWithName:@"Polish" identifier:@"polish"],
                   [[RestaurantCategory alloc] initWithName:@"Portuguese" identifier:@"portuguese"],
                   [[RestaurantCategory alloc] initWithName:@"Russian" identifier:@"russian"],
                   [[RestaurantCategory alloc] initWithName:@"Salad" identifier:@"salad"],
                   [[RestaurantCategory alloc] initWithName:@"Sandwiches" identifier:@"sandwiches"],
                   [[RestaurantCategory alloc] initWithName:@"Scandinavian" identifier:@"scandinavian"],
                   [[RestaurantCategory alloc] initWithName:@"Scottish" identifier:@"scottish"],
                   [[RestaurantCategory alloc] initWithName:@"Seafood" identifier:@"seafood"],
                   [[RestaurantCategory alloc] initWithName:@"Singaporean" identifier:@"singaporean"],
                   [[RestaurantCategory alloc] initWithName:@"Slovakian" identifier:@"slovakian"],
                   [[RestaurantCategory alloc] initWithName:@"Soul Food" identifier:@"soulfood"],
                   [[RestaurantCategory alloc] initWithName:@"Soup" identifier:@"soup"],
                   [[RestaurantCategory alloc] initWithName:@"Southern" identifier:@"southern"],
                   [[RestaurantCategory alloc] initWithName:@"Spanish" identifier:@"spanish"],
                   [[RestaurantCategory alloc] initWithName:@"Steakhouses" identifier:@"steak"],
                   [[RestaurantCategory alloc] initWithName:@"Sushi Bars" identifier:@"sushi"],
                   [[RestaurantCategory alloc] initWithName:@"Taiwanese" identifier:@"taiwanese"],
                   [[RestaurantCategory alloc] initWithName:@"Tapas Bars" identifier:@"tapas"],
                   [[RestaurantCategory alloc] initWithName:@"Tapas/Small Plates" identifier:@"tapasmallplates"],
                   [[RestaurantCategory alloc] initWithName:@"Tex-Mex" identifier:@"tex-mex"],
                   [[RestaurantCategory alloc] initWithName:@"Thai" identifier:@"thai"],
                   [[RestaurantCategory alloc] initWithName:@"Turkish" identifier:@"turkish"],
                   [[RestaurantCategory alloc] initWithName:@"Ukrainian" identifier:@"ukrainian"],
                   [[RestaurantCategory alloc] initWithName:@"Vegan" identifier:@"vegan"],
                   [[RestaurantCategory alloc] initWithName:@"Vegetarian" identifier:@"vegetarian"],
                   [[RestaurantCategory alloc] initWithName:@"Vietnamese" identifier:@"vietnamese"],
                   ];
    return categories;
}

- (instancetype)initWithName:(NSString *)name identifier:(NSString *)identifier {
    self = [super init];
    if (self) {
        self.name = name;
        self.identifier = identifier;
    }
    return self;
}

@end
