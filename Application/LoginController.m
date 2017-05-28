#import "LoginController.h"
#import "MainMenuSubViewViewController.h"
#import "LeftNavigationMenu.h"
#import "RegisterViewController.h"


@interface LoginController () <SWRevealViewControllerDelegate>

@end

@implementation LoginController


@synthesize revealController;

@synthesize usernameField;
@synthesize passwordField;
@synthesize button;
@synthesize registerButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    revealController = [self revealViewController];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)buttonClicked:(UIButton*)sender {
    if ([sender.titleLabel.text isEqualToString:@"Login"]) {
        [self login];
    }
    if ([sender.titleLabel.text isEqualToString:@"Register"]) {
        [self registerAccount];
    }
}


#pragma mark - Custom Methods

-(void)login{
    
    // Close the keyboard
    [usernameField resignFirstResponder];
    
    // Executable block to clear text fields
    void (^clearTextFieldBlock)(void) =
    ^{
        usernameField.text = @"";
        passwordField.text = @"";
    };
    
    // Retrieve the input strings from the text field
    NSString *inputUsername = [[NSString alloc] initWithString:usernameField.text];
    NSString *inputPassword = [[NSString alloc] initWithString:passwordField.text];
    
    NSArray *allCustomers = [self fetchCustomerData];
    
    BOOL matchfound = NO;
    
    for (NSManagedObject *customer in allCustomers){
        
        NSString *customerUsername = [[NSString alloc] initWithString:[customer valueForKey:@"customerUsername"]];
        NSString *customerPassword = [[NSString alloc] initWithString:[customer valueForKey:@"customerPassword"]];
        
        // Success scenario
        if (([inputUsername isEqualToString:customerUsername]) && ([inputPassword isEqualToString:customerPassword])) {
            
            matchfound = YES;
            
            UIAlertController *successAlertController = [UIAlertController
                                                         alertControllerWithTitle:@"Success"
                                                         message:[NSString
                                                                  stringWithFormat: @"Welcome %@", [customer valueForKey:@"customerFullName"]]
                                                         preferredStyle:UIAlertControllerStyleAlert];
            
            [successAlertController addAction:[UIAlertAction
                                               actionWithTitle:@"Success!"
                                               style:UIAlertActionStyleDefault
                                               handler:nil]];
            
            [self presentViewController:successAlertController animated:YES completion:clearTextFieldBlock];
            
            // Waits 1.5seconds for the splash screen
            [NSTimer
             scheduledTimerWithTimeInterval:1.0f
             target:self
             selector:@selector(goToMainMenu)
             userInfo:nil
             repeats:NO];
            
        }
    }
    
    if (matchfound == NO) {
        UIAlertController *errorAlertController = [UIAlertController
                                                   alertControllerWithTitle:@"Error"
                                                   message:@"Invalid credentials"
                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [errorAlertController addAction:[UIAlertAction
                                         actionWithTitle:@"Back"
                                         style:UIAlertActionStyleDestructive
                                         handler:nil]];
        
        [self presentViewController:errorAlertController
                           animated:YES
                         completion:clearTextFieldBlock];

    }

}



- (NSArray*)fetchCustomerData {
    DataStore *dataStore = [DataStore sharedDataStorage];
    NSManagedObjectContext *context = [dataStore context];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Customer"];
    
    NSError *error;
    
    NSArray *allCustomers = [context executeFetchRequest:request error:&error];
    
    if (!allCustomers) {
        NSLog(@"Error: %@", [error localizedDescription]);
        return nil;
    }
    
//    for (NSManagedObject *customer in allCustomers){
//        NSLog(@"%@ %@ %@ %@",
//              [customer valueForKey:@"customerUsername"],
//              [customer valueForKey:@"customerPassword"],
//              [customer valueForKey:@"customerFullName"],
//              [customer valueForKey:@"customerEmail"]);
//    }
    
    return allCustomers;
}


- (void)registerAccount {
    RegisterViewController *frontView = [[RegisterViewController alloc]
                                         initWithNibName:@"RegisterViewController"
                                         bundle:nil];
    
    [revealController pushFrontViewController:frontView animated:YES];

}

- (void)goToMainMenu {
    MainMenuSubViewViewController *frontView = [[MainMenuSubViewViewController alloc]
                                                initWithNibName:@"MainMenuSubViewViewController"
                                                bundle:[NSBundle mainBundle]];
    
    UINavigationController *frontNavigationController = [[UINavigationController alloc]
                                                         initWithRootViewController:frontView];
    
    [revealController initWithRearViewController:nil
                                      frontViewController:frontNavigationController];
    
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
