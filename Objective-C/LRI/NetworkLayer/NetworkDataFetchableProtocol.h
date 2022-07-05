//
//  NetworkDataFetchableProtocol.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "Endpoint.h"
#import "DrinkItem.h"

@protocol NetworkDataFetchableProtocol
- (NSURLSessionDataTask *)performRequestWithEndpoint:(id<Endpoint>) endpoint withCompletion:(void (^)(NSMutableArray<DrinkItem *> *items, NSError *error)) completion;
@end
