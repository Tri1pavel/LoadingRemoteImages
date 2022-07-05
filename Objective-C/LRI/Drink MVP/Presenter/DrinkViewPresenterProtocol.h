//
//  DrinkViewPresenterProtocol.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "DrinkItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DrinkViewPresenterProtocol <NSObject>
- (NSMutableArray<DrinkItem *> *)getItems;
- (NSInteger)getCount;
- (void)getDrinks;
@end

NS_ASSUME_NONNULL_END

