#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"

@interface LoginController : UIViewController



#pragma mark - Properties

@property (nonatomic, strong) SWRevealViewController *revealController;

@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UIButton *button;
@property (nonatomic, strong) IBOutlet UIButton *registerButton;



#pragma mark - Actions

- (IBAction)buttonClicked:(UIButton*)sender;


#pragma mark - Custom Implemented Methods

- (void)goToMainMenu;
- (void)login;
- (void)registerAccount;
- (NSArray*)fetchCustomerData;

@end
