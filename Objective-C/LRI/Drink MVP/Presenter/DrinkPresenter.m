//
//  DrinkPresenter.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "DrinkPresenter.h"
#import "DrinkEndpoint.h"
#import "Drinkmodel.h"

@interface DrinkPresenter ()
@property (nonatomic, weak) id <DrinkViewProtocol> delegate;
@property (nonatomic, strong) id <NetworkDataFetchableProtocol> networkAPI;
@property (nonatomic, strong) DrinkModel *model;
@end

@implementation DrinkPresenter

- (instancetype)initWithViewDelegate:(id <DrinkViewProtocol>) delegate withNetworkAPI:(id <NetworkDataFetchableProtocol>) networkAPI {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.networkAPI = networkAPI;
        self.model = [[DrinkModel alloc] init];
    }
    return self;
}

- (nonnull NSMutableArray<DrinkItem *> *)getItems {
    return [self.model getItems];
}

- (NSInteger)getCount {
    return [self.model getCount];
}

- (void)getDrinks {
    DrinkEndpoint *endpoint = [[DrinkEndpoint alloc] init];
    [self.networkAPI performRequestWithEndpoint:endpoint withCompletion:^(NSMutableArray<DrinkItem *> *items, NSError *error) {
        __weak typeof(self) weakSelf = self;
        if (error == nil) {
            [weakSelf.model fillDataWith:items];
            [weakSelf.delegate presentDrinks];
        } else {
            NSString *title = @"Something went wrong";
            NSString *message = [error.userInfo valueForKey:@"NSLocalizedDescription"];
            [weakSelf.delegate presentAlertWith:title withMessage:message];
        }
    }];
}

@end
