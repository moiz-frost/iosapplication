#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"


@interface MainMenuSubViewViewController : UIViewController

@property (nonatomic, readwrite, strong) IBOutlet UILabel *menuSubHeading;
@property (nonatomic, strong) SWRevealViewController *revealController;

@end
