//
//  DrinkModel.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <Foundation/Foundation.h>
#import "DrinkModel.h"

@interface DrinkModel ()
@property (nonatomic, strong) NSMutableArray<DrinkItem *> *items;
@end

@implementation DrinkModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithItems:(NSMutableArray<DrinkItem *> *) items {
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

- (void)fillDataWith:(NSMutableArray<DrinkItem *> *) items {
    self.items = items;
}

- (NSMutableArray<DrinkItem *> *)getItems {
    return self.items;
}

- (NSInteger)getCount {
    return [self.items count];
}

@end
