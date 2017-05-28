#import <UIKit/UIKit.h>


@protocol LeftNavigatioNMenuProtocol <NSObject>

- (void)cellClicked:(NSString*)cellLabelValue withImages:(NSArray*)imageList;

@end



@interface LeftNavigationMenu : UITableViewController


#pragma mark - Menu Items and Images

@property (nonatomic, strong) NSArray *menuList;
@property (nonatomic, strong) NSArray *sideMenuListImages;

@property (nonatomic, strong) NSArray *appetizersImages;
@property (nonatomic, strong) NSArray *chineseImages;
@property (nonatomic, strong) NSArray *dessertsImages;
@property (nonatomic, strong) NSArray *drinksImages;
@property (nonatomic, strong) NSArray *fastFoodImages;
@property (nonatomic, strong) NSArray *frenchImages;
@property (nonatomic, strong) NSArray *saladImages;


#pragma mark - Deleagate

@property (nonatomic, weak) id<LeftNavigatioNMenuProtocol> delegate;

@end
