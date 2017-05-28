#import <UIKit/UIKit.h>

@interface CustomLeftNavigationTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) IBOutlet UIImageView *categoryImage;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *categoryName;



+ (NSString*)cellIdentifier;

@end
