#import <UIKit/UIKit.h>

@interface LoginController : UIViewController



#pragma mark - Properties

@property (nonatomic, readwrite, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, readwrite, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, readwrite, weak) IBOutlet UIButton *button;



#pragma mark - Actions

-(IBAction)buttonClicked:(id)sender;


#pragma mark - Custom Implemented Methods

-(void)goToMainMenu;

@end
