//
//  DrinkViewProtocol.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DrinkViewProtocol <NSObject>
- (void)presentDrinks;
- (void)presentAlertWith:(NSString *) title withMessage:(NSString *) message;
@end

NS_ASSUME_NONNULL_END
