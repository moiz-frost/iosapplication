#import "CustomLeftNavigationTableViewCell.h"

@implementation CustomLeftNavigationTableViewCell

@synthesize categoryImage;
@synthesize categoryName;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)cellIdentifier{
    static NSString *cellIdentifier = @"MenuItem";
    return cellIdentifier;
}

@end
