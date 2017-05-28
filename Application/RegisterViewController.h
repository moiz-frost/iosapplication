#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "DataStore.h"

@interface RegisterViewController : UIViewController


@property (nonatomic, strong) SWRevealViewController *revealController;

@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UITextField *fullName;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *contact;

@property (nonatomic, strong) IBOutlet UIButton *registerButton;
@property (nonatomic, strong) IBOutlet UIButton *backButton;

# pragma mark - Actions

- (IBAction)goBack:(UIButton*)sender;
- (IBAction)addNewUser:(UIButton*)sender;

@end
