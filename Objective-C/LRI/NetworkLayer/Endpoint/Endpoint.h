//
//  Endpoint.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>

@protocol Endpoint
// http / https
- (NSString *) scheme;

// GET / POST / ...
- (NSString *) method;

// Sample: www.thecocktaildb.com
- (NSString *) baseURL;

// Sample: /api/json/v1/1/filter.php
- (NSString *) path;

// Sample: [URLQueryItem(name: a, value: Alcoholic)]
- (NSMutableArray <NSURLQueryItem *> *) parameters;
@end

