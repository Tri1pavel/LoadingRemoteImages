//
//  DrinkPresenter.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import "DrinkViewPresenterProtocol.h"
#import "DrinkViewProtocol.h"
#import "NetworkDataFetchableProtocol.h"

@interface DrinkPresenter : NSObject <DrinkViewPresenterProtocol>
- (instancetype)initWithViewDelegate:(id <DrinkViewProtocol>) delegate
                      withNetworkAPI:(id <NetworkDataFetchableProtocol>) networkAPI;
@end
