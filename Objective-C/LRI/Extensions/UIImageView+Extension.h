//
//  UIImageView+Extension.h
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extension)

- (void)asyncImageWith:(NSString *) urlString
       withPlaceholder:(UIImage *) placeholder
        withCompletion:(void (^)(UIImage *image, BOOL wasCached)) completion;

@end

NS_ASSUME_NONNULL_END
