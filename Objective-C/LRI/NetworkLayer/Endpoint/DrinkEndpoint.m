//
//  DrinkEndpoint.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>

#import "DrinkEndpoint.h"

@interface DrinkEndpoint ()
@end

@implementation DrinkEndpoint

- (NSString *)scheme {
    return @"https";
}

- (NSString *)method {
    return @"GET";
}

- (NSString *)baseURL {
    return @"www.thecocktaildb.com";
}

- (NSString *)path {
    return @"/api/json/v1/1/filter.php";
}

- (NSMutableArray<NSURLQueryItem *> *)parameters {
    return [[NSMutableArray alloc] initWithObjects:[[NSURLQueryItem alloc] initWithName:@"a" value:@"Alcoholic"], nil];
}

@end
