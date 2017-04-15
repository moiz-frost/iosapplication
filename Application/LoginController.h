#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

@property (nonatomic, readwrite, weak) IBOutlet UITextField *textField;
@property (nonatomic, readwrite, weak) IBOutlet UIButton *button;

-(IBAction)buttonClicked:(id)sender;
-(IBAction)textFieldClicked:(id)sender;
@end
