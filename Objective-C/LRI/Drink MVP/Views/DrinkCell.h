//
//  DrinkCell.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <UIKit/UIKit.h>
#import "DrinkItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrinkCell : UITableViewCell

+ (NSString *) identifier;
- (void)display:(DrinkItem *) item;

@end

NS_ASSUME_NONNULL_END
