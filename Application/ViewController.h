//
//  ViewController.h
//  Application
//
//  Created by Abdul Moiz on 15/04/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, readwrite, weak) IBOutlet UITextField *textField;
@property (nonatomic, readwrite, weak) IBOutlet UIButton *button;

-(IBAction)buttonClicked:(id)sender;
@end
