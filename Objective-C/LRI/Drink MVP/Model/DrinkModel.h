//
//  DrinkModel.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "DrinkItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrinkModel : NSObject
- (instancetype)init;
- (instancetype)initWithItems:(NSMutableArray<DrinkItem *> *) items;
- (void)fillDataWith:(NSMutableArray<DrinkItem *> *) items;
- (NSMutableArray<DrinkItem *> *)getItems;
- (NSInteger)getCount;
@end

NS_ASSUME_NONNULL_END
