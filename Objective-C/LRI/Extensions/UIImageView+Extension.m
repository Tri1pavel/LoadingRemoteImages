//
//  UIImageView+Extension.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import <UIKit/UIKit.h>

@interface ImageCache : NSObject
+ (instancetype)shared;
@property (nonatomic, strong) NSCache *cache;
@end

@implementation ImageCache

static ImageCache *shared = nil;

+ (instancetype)shared {
    if (shared == nil) {
        shared = [[ImageCache alloc] init];
    }
    return shared;
}

- (UIImage *)getObjectForKey:(NSString *)key {
    return  [self.cache objectForKey:key];
}

- (void)setObject:(UIImage *)object forKey:(NSString *)key {
    [self.cache setObject:object forKey:key];
}

@end
 
@implementation UIImageView (Extension)

- (void)asyncImageWith:(NSString *) urlString
       withPlaceholder:(UIImage *) placeholder
        withCompletion:(void (^)(UIImage *image, BOOL wasCached)) completion {
    self.image = placeholder;
    
    UIImage *image = [ImageCache.shared getObjectForKey:urlString];
    if (image != nil) {
        completion(image, true);
        return;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if ((data != nil) && (error == nil)) {
                UIImage *image = [UIImage imageWithData:data];
                completion(image, false);
            }
        });
    }];
    [task resume];
}

@end
