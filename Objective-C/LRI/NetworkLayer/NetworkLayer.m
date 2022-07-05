//
//  NetworkLayer.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "NetworkLayer.h"
#import "DrinkEndpoint.h"
#import "DrinkItem.h"

@interface NetworkLayer ()

@end

@implementation NetworkLayer

- (NSURLSessionDataTask *)performRequestWithEndpoint:(id<Endpoint>) endpoint withCompletion:(void (^)(NSMutableArray<DrinkItem *> *items, NSError *error)) completion {
    NSURLComponents *components = [[NSURLComponents alloc] init];
    [components setPath: endpoint.path];
    [components setScheme: endpoint.scheme];
    [components setHost: endpoint.baseURL];
    [components setQueryItems: endpoint.parameters];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:components.URL];
    [request setHTTPMethod: endpoint.method];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
 
        NSError *decodingError;
        NSMutableArray *jsonArray = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:NSASCIIStringEncoding error:&decodingError];
        
        if ((error != nil) || (decodingError != nil)) {
            NSError *customError = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:200 userInfo:@{
                NSLocalizedDescriptionKey:@"The server responded with an error."}];
            completion(NSMutableArray.new, customError);
            return;
        }
                
        NSMutableArray <DrinkItem *> *items = NSMutableArray.new;
        for (NSMutableDictionary *dictionary in [jsonArray valueForKey:@"drinks"]) {
            DrinkItem *item = [DrinkItem withDictionary:dictionary];
            [items addObject:item];
        }
        
        completion(items, nil);
    }];
    [dataTask resume];
    return dataTask;
}

@end
