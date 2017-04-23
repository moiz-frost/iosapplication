

#import "CustomLeftNavigationTableViewCell.h"

@implementation CustomLeftNavigationTableViewCell

@synthesize categoryImage;
@synthesize categoryName;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString*)cellIdentifier{
    static NSString *cellIdentifier = @"MenuItem";
    return cellIdentifier;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
