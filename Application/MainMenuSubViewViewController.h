#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"


@interface MainMenuSubViewViewController : UIViewController


#pragma mark - Image Properties

@property(nonatomic, weak) IBOutlet UIImageView *image1;
@property(nonatomic, weak) IBOutlet UIImageView *image2;
@property(nonatomic, weak) IBOutlet UIImageView *image3;
@property(nonatomic, weak) IBOutlet UIImageView *image4;
@property(nonatomic, weak) IBOutlet UIImageView *image5;
@property(nonatomic, weak) IBOutlet UIImageView *image6;

#pragma mark - Properties

@property (nonatomic, readwrite, strong) IBOutlet UILabel *menuSubHeading;
@property (nonatomic, strong) SWRevealViewController *revealController;


#pragma mark - LeftNavigationMenuProtocolMethods

- (void)cellClicked:(NSString*)cellLabelValue withImages:(NSArray*)imageList;


@end
