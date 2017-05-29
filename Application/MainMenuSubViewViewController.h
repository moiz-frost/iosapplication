#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "CustomImageView.h"



//@protocol MainMenuProtocol <NSObject>
//
//- (void)imageClicked:(NSString*)imageName;
//
//@end


@interface MainMenuSubViewViewController : UIViewController


#pragma mark - Image Properties

@property(nonatomic, weak) IBOutlet CustomImageView *image1;
@property(nonatomic, weak) IBOutlet CustomImageView *image2;
@property(nonatomic, weak) IBOutlet CustomImageView *image3;
@property(nonatomic, weak) IBOutlet CustomImageView *image4;
@property(nonatomic, weak) IBOutlet CustomImageView *image5;
@property(nonatomic, weak) IBOutlet CustomImageView *image6;

#pragma mark - Properties

@property (nonatomic, readwrite, strong) IBOutlet UILabel *menuSubHeading;
@property (nonatomic, strong) SWRevealViewController *revealController;


#pragma mark - LeftNavigationMenuProtocolMethods

- (void)cellClicked:(NSString*)cellLabelValue withImages:(NSArray*)imageList;

#pragma mark - Custom Methods


@end
