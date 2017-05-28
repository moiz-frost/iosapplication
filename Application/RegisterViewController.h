#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "DataStore.h"

@interface RegisterViewController : UIViewController


@property (nonatomic, strong) SWRevealViewController *revealController;



#pragma mark - Labels

@property (nonatomic, weak) IBOutlet UILabel *usernameError;
@property (nonatomic, weak) IBOutlet UILabel *fullnameError;
@property (nonatomic, weak) IBOutlet UILabel *emailError;
@property (nonatomic, weak) IBOutlet UILabel *contactError;

#pragma mark - Text Fields

@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UITextField *fullNameField;
@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *contactField;

#pragma mark - Buttons

@property (nonatomic, strong) IBOutlet UIButton *registerButton;
@property (nonatomic, strong) IBOutlet UIButton *backButton;

# pragma mark - Actions

- (IBAction)goBack:(UIButton*)sender;
- (IBAction)addNewUser:(UIButton*)sender;

#pragma mark - Customer Regex Methods

- (BOOL)checkfullnameRegex:(NSString*)input;
- (BOOL)checkEmailRegex:(NSString*)input;
- (BOOL)checkContactRegex:(NSString*)input;

#pragma mark - Customer Methods

- (void)persistNewCustomerWithUsername:(NSString*)username
                              password:(NSString*)password
                              fullname:(NSString*)fullName
                                 email:(NSString*)email
                               contact:(NSString*)contact;

- (void)goToLoginPage;

@end
