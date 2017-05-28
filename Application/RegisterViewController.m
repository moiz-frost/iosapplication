#import "RegisterViewController.h"
#import "LoginController.h"

@interface RegisterViewController ()

@end



@implementation RegisterViewController



@synthesize revealController;

@synthesize usernameField;
@synthesize passwordField;
@synthesize fullName;
@synthesize email;
@synthesize contact;

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
    LoginController *loginController = [[LoginController alloc] initWithNibName:@"LoginController" bundle:[NSBundle mainBundle]];
 
    [revealController initWithRearViewController:nil frontViewController:loginController];
}

- (IBAction)addNewUser:(UIButton*)sender {
//    NSLog(@"%@", usernameField.text);
//    NSLog(@"%@", passwordField.text);
//    NSLog(@"%@", fullName.text);
//    NSLog(@"%@", email.text);
//    NSLog(@"%@", contact.text);
    DataStore *dataStore = [DataStore sharedDataStorage];
    NSManagedObjectContext *context = [dataStore context];
    
    NSManagedObject *customer = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
    
    [customer setValue:usernameField.text forKey:@"customerUsername"];
    [customer setValue:passwordField.text forKey:@"customerPassword"];
    [customer setValue:fullName.text forKey:@"customerFullName"];
    [customer setValue:email.text forKey:@"customerEmail"];
//    [customer setValue:contact.text forKey:@"customerContact"];
    
    [dataStore saveChanges];
    
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
