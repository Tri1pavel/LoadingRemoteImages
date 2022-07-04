//
//  DrinkItem.h
//  LRI
//
//  Created by Development on 04.07.2022.
//

#import <Foundation/Foundation.h>

@interface DrinkItem : NSObject <NSCoding>

@property (strong, nonatomic) NSString *strDrink;
@property (strong, nonatomic) NSString *strDrinkThumb;
@property (strong, nonatomic) NSString *idDrink;

+ (DrinkItem *)withDictionary:(NSMutableDictionary *)dictionary;

@end
