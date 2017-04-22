#import <UIKit/UIKit.h>


@protocol LeftNavigatioNMenuProtocol <NSObject>

- (void)cellClicked:(NSString*)cellLabelValue;

@end



@interface LeftNavigationMenu : UITableViewController

@property (nonatomic, strong) NSArray *menuList;
@property (nonatomic, weak) id<LeftNavigatioNMenuProtocol> delegate;

@end
