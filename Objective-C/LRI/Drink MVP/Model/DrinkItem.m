//
//  DrinkItem.m
//  LRI
//
//  Created by Development on 04.07.2022.
//

#import "DrinkItem.h"

@interface DrinkItem()

@end

@implementation DrinkItem

#define kStrDrink       @"strDrink"
#define kStrDrinkThumb  @"strDrinkThumb"
#define kIDDrink        @"idDrink"

+ (DrinkItem *)withDictionary:(NSMutableDictionary *)dictionary {
    NSString *strDrink = [dictionary valueForKey:kStrDrink];
    NSString *strDrinkThumb = [dictionary valueForKey:kStrDrinkThumb];
    NSString *idDrink = [dictionary valueForKey:kIDDrink];
    DrinkItem *item = [[DrinkItem alloc] initWithStrDrink: strDrink
                                        withStrDrinkThumb: strDrinkThumb
                                              withIDDrink: idDrink];
    return item;
}

- (id)initWithStrDrink:(NSString *)strDrink
     withStrDrinkThumb:(NSString *)strDrinkThumb
           withIDDrink:(NSString *) idDrink {
    self = [super init];
    if (self) {
        self.strDrink = strDrink;
        self.strDrinkThumb = strDrinkThumb;
        self.idDrink = idDrink;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)encoder {
    [encoder encodeObject:self.strDrink forKey:kStrDrink];
    [encoder encodeObject:self.strDrinkThumb forKey:kStrDrinkThumb];
    [encoder encodeObject:self.idDrink forKey:kIDDrink];
}

- (id)initWithCoder:(nonnull NSCoder *)decoder {
    NSString *strDrink = [decoder decodeObjectForKey:kStrDrink];
    NSString *strDrinkThumb = [decoder decodeObjectForKey:kStrDrinkThumb];
    NSString *idDrink = [decoder decodeObjectForKey:kIDDrink];
    DrinkItem *item = [[DrinkItem alloc] initWithStrDrink: strDrink
                                        withStrDrinkThumb: strDrinkThumb
                                              withIDDrink: idDrink];
    return item;
}

@end

