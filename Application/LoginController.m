#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

@synthesize textField;
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

- (IBAction)textFieldClicked:(id)sender {
    NSLog(@"Inside Text field");
}

- (IBAction)buttonClicked:(id)sender {
    // Close the keyboard
    [textField resignFirstResponder];
    
    // Retrieve the input string from the text field
    NSString *inputName = [[NSString alloc] initWithString:textField.text];
    
    // Executable block to clear text field after on success alert view
    void (^clearTextFieldBlock)(void) = ^{
        textField.text = @"";
    };
    
    // If textfield empty
    if ([inputName length] == 0) {
        
        UIAlertController *errorAlerController = [UIAlertController
                                    alertControllerWithTitle:@"Error"
                                    message:@"Text field is empty"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        [errorAlerController addAction:[UIAlertAction
                                    actionWithTitle:@"Back"
                                    style:UIAlertActionStyleDestructive
                                    handler:nil]];
        [self presentViewController:errorAlerController animated:YES completion:nil];
        
    } else {
        
    // If textfield not empty
    UIAlertController *successAlertController = [UIAlertController
                                            alertControllerWithTitle:@"Success!"
                                            message:[NSString stringWithFormat: @"Welcome %@", inputName]
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [successAlertController addAction:[UIAlertAction
                                      actionWithTitle:@"Correct!"
                                      style:UIAlertActionStyleDefault
                                      handler:nil]];
    [self presentViewController:successAlertController animated:YES completion:clearTextFieldBlock];
        
    }
    
    
    
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
