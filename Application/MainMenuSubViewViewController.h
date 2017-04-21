#import <UIKit/UIKit.h>
#import "LeftNavigationMenu.h"

@interface MainMenuSubViewViewController : UIViewController


@property (nonatomic, strong) LeftNavigationMenu *menuItem;

- (UIButton *)createButtonWithNormalImage:(NSString *)imageNormalName
                       pressedButtonImage:(NSString *)imagePressedName
                           forNormalState:(UIControlState)normalState
                          forPressedState:(UIControlState)pressedState
                                   action:(SEL)action
                         forControlEvents:(UIControlEvents)event;

- (void)showMenuItemViewController;

@end
