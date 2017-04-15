//
//  ViewController.m
//  Application
//
//  Created by Abdul Moiz on 15/04/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField = _textField;
@synthesize button = _button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    // Close the keyboard
    [self.textField resignFirstResponder];
    
    // Retrieve the input string from the text field
    NSString *inputName = [[NSString alloc] initWithString:self.textField.text];
    
    // Executable block to clear text field after on success alert view
    void (^clearTextFieldBlock)(void) = ^{
        self.textField.text = @"";
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
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
