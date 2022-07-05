//
//  DrinkCell.m
//  LRI
//
//  Created by Development on 05.07.2022.
//

#import "DrinkCell.h"
#import "UIImageView+Extension.h"

@interface DrinkCell ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *previewImageView;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation DrinkCell

+ (NSString *) identifier {
    return @"DrinkCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)display:(DrinkItem *) item {
    self.cachedUrl = item.strDrinkThumb;
    
    self.descriptionLabel.text = item.strDrink;
    
    [self.previewImageView asyncImageWith:item.strDrinkThumb
                          withPlaceholder:[UIImage imageNamed:@"placeholder"]
                           withCompletion:^(UIImage * _Nonnull image, BOOL wasCached) {
        __weak typeof(self) weakSelf = self;
        if (wasCached || self.cachedUrl == item.strDrinkThumb) {
            weakSelf.previewImageView.image = image;
            [weakSelf.activityIndicator stopAnimating];
        }
    }];
}

@end
