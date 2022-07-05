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
#import "DrinkPresenter.h"
#import "NetworkLayer.h"
#import "DrinkViewProtocol.h"

@interface DrinksTableViewController () <DrinkViewProtocol>
@property (nonatomic, strong) DrinkPresenter *presenter;
@end

@implementation DrinksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.refreshControl addTarget:self
                                      action:@selector(refresh)
                            forControlEvents:UIControlEventValueChanged];
    
    NetworkLayer *networkAPI = [[NetworkLayer alloc] init];
    self.presenter = [[DrinkPresenter alloc] initWithViewDelegate:self
                                                   withNetworkAPI:networkAPI];
    [self.presenter getDrinks];
}

- (void)refresh {
    [self.presenter getDrinks];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.presenter getCount];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DrinkCell *cell = (DrinkCell *)[tableView dequeueReusableCellWithIdentifier:DrinkCell.identifier forIndexPath:indexPath];
    
    DrinkItem *item = [self.presenter getItems][indexPath.row];
    
    [cell display: item];
    
    return cell;
}

#pragma mark - DrinkViewProtocol
- (void)presentAlertWith:(nonnull NSString *)title withMessage:(nonnull NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [[UIAlertController alloc] init];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Dismiss"
                                                         style:UIAlertActionStyleDefault
                                                       handler:nil];
        [alert setTitle:title];
        [alert setMessage:message];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        [self.refreshControl endRefreshing];
    });
}

- (void)presentDrinks {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    });
}

@end
