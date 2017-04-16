#import "LoginController.h"
#import "NavigationSideMenuTableViewController.h"

@interface LoginController ()

@end

@implementation LoginController

@synthesize usernameField;
@synthesize passwordField;
@synthesize button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)buttonClicked:(id)sender {
    NSString *actualUsername = @"admin";
    NSString *actualPassword = @"admin";
    
    // Close the keyboard
    [usernameField resignFirstResponder];
    
    // Retrieve the input strings from the text field
    NSString *inputUsername = [[NSString alloc] initWithString:usernameField.text];
    NSString *inputPassword = [[NSString alloc] initWithString:passwordField.text];
    
    // Executable block to clear text field after on success alert view
    void (^clearTextFieldBlock)(void) =
    ^{
        usernameField.text = @"";
        passwordField.text = @"";
    };
    
    if (([inputUsername isEqualToString:actualUsername]) && ([inputPassword isEqualToString:actualPassword]))
        // Success scenario
    {
        
        UIAlertController *successAlertController = [UIAlertController
                                                     alertControllerWithTitle:@"Success"
                                                     message:[NSString
                                                              stringWithFormat: @"Welcome %@", actualUsername]
                                                     preferredStyle:UIAlertControllerStyleAlert];
        
        
        [successAlertController addAction:[UIAlertAction
                                           actionWithTitle:@"Success!"
                                           style:UIAlertActionStyleDefault
                                           handler:nil]];
        
//        [self presentViewController:successAlertController animated:YES completion:clearTextFieldBlock];
        
        [self goToNextViewController];
        
    }
    
    if ((![inputUsername isEqualToString:actualUsername]) || (![inputPassword isEqualToString:actualPassword]))
        // If invalid field empty
    {
        
        UIAlertController *errorAlertController = [UIAlertController
                                                   alertControllerWithTitle:@"Error"
                                                   message:@"Invalid credentials"
                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [errorAlertController addAction:[UIAlertAction
                                         actionWithTitle:@"Back"
                                         style:UIAlertActionStyleDestructive
                                         handler:nil]];
        
        [self presentViewController:errorAlertController animated:YES completion:clearTextFieldBlock];
        
        
    }
    
}


- (void)goToNextViewController {
    NavigationSideMenuTableViewController *leftSideMenuBar = [[NavigationSideMenuTableViewController alloc] initWithNibName:@"NavigationSideMenuTableViewController" bundle:nil];
    
    [self.navigationController pushViewController:leftSideMenuBar animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
