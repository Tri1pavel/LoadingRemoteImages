//
//  DrinksTableViewController.m
//  LRI
//
//  Created by Development on 04.07.2022.
//

#import "DrinksTableViewController.h"
#import "DrinkCell.h"
#import "DrinkItem.h"
#import "DrinkEndpoint.h"

#import "NetworkLayer.h"

@interface DrinksTableViewController ()

@end

@implementation DrinksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DrinkCell.identifier forIndexPath:indexPath];
    
    return cell;
}

@end
