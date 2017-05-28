#import "RegisterViewController.h"
#import "LoginController.h"

@interface RegisterViewController ()

@end



@implementation RegisterViewController



@synthesize revealController;

@synthesize usernameError;
@synthesize fullnameError;
@synthesize emailError;
@synthesize contactError;

@synthesize usernameField;
@synthesize passwordField;
@synthesize fullNameField;
@synthesize emailField;
@synthesize contactField;

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

- (IBAction)goBack:(UIButton *)sender {
    [self goToLoginPage];
}

- (IBAction)addNewUser:(UIButton*)sender {
    
    [usernameError setText:@""];
    [fullnameError setText:@""];
    [emailError setText:@""];
    [contactError setText:@""];
    
    BOOL allFieldsValidated = YES;
    
    if (![self checkfullnameRegex:fullNameField.text]) {
        allFieldsValidated = NO;
        [fullnameError setText:@"Invalid Name"];
    }
    
    if (![self checkEmailRegex:emailField.text]) {
        allFieldsValidated = NO;
        [emailError setText:@"Invalid Email"];
    }
    
    if (![self checkContactRegex:contactField.text]) {
        allFieldsValidated = NO;
        [contactError setText:@"Invalid Contact"];
    }
    
    if (!allFieldsValidated) {
        NSLog(@"NO");
        return;
    }
    
    if (allFieldsValidated) {
        NSLog(@"Yea");
        
        void (^blockForAlertView)(void) =
        ^{
            [self goToLoginPage];
        };
        
        [self persistNewCustomerWithUsername:usernameField.text
                                    password:passwordField.text
                                    fullname:fullNameField.text
                                       email:emailField.text
                                     contact:contactField.text];
        
        UIAlertController *successAlertController = [UIAlertController
                                                     alertControllerWithTitle:@"Success"
                                                     message:@"Registered!"
                                                     preferredStyle:UIAlertControllerStyleAlert];
        
        [successAlertController addAction:[UIAlertAction
                                           actionWithTitle:@"Login"
                                           style:UIAlertActionStyleDefault
                                           handler:nil]];
        
        [self presentViewController:successAlertController animated:YES completion:blockForAlertView];
        
        return;
    }
    
    
}


#pragma mark - Customer Regex Methods

- (BOOL)checkEmailRegex:(NSString*)input {
    NSString *expression = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:input
                                                    options:0
                                                      range:NSMakeRange(0, [input length])];
    
    if (match){
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)checkContactRegex:(NSString*)input {
    NSString *expression = [NSString stringWithFormat:@"^[0][3][0-9]{9}$"];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:input
                                                        options:0
                                                          range:NSMakeRange(0, [input length])];
    if (numberOfMatches == 0) {
        return NO;
    }
    
    return YES;
}


- (BOOL)checkfullnameRegex:(NSString*)input {
    NSString *expression = [NSString stringWithFormat: @"^[a-z]{1,15} [a-z]{1,10}$"];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:input
                                                        options:0
                                                          range:NSMakeRange(0, [input length])];
    if (numberOfMatches == 0) {
        return NO;
    }
    
    return YES;
}


#pragma mark - Custom Implemented Methods

- (void)persistNewCustomerWithUsername:(NSString *)username
                              password:(NSString *)password
                              fullname:(NSString *)fullName
                                 email:(NSString *)email
                               contact:(NSString *)contact{
    
    DataStore *dataStore = [DataStore sharedDataStorage];
    NSManagedObjectContext *context = [dataStore context];
    
    NSManagedObject *customer = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
    
    [customer setValue:username forKey:@"customerUsername"];
    [customer setValue:password forKey:@"customerPassword"];
    [customer setValue:fullName forKey:@"customerFullName"];
    [customer setValue:email forKey:@"customerEmail"];
    [customer setValue:contact forKey:@"customerContact"];
    
    [dataStore saveChanges];
}

- (void)goToLoginPage {
    LoginController *loginController = [[LoginController alloc] initWithNibName:@"LoginController" bundle:[NSBundle mainBundle]];
    
    [revealController initWithRearViewController:nil frontViewController:loginController];
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
