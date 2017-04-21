#import "MainMenuSubViewViewController.h"

@interface MainMenuSubViewViewController ()

@end

@implementation MainMenuSubViewViewController

@synthesize menuItem;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItem = [[LeftNavigationMenu alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController.navigationBar
     setBackgroundImage:[UIImage imageNamed:@"iphone_top_bar_bg@2x.png"]
     forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *leftButtonCustomView = [self createButtonWithNormalImage:@"btn_left_nav_normal@2x.png"
                                                    pressedButtonImage:@"btn_left_nav_pressed@2x.png"
                                                        forNormalState:UIControlStateNormal
                                                       forPressedState:UIControlStateHighlighted
                                                                action:@selector(showMenuItemViewController)
                                                      forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButtonCustomView = [self createButtonWithNormalImage:@"btn_right_nav_normal@2x.png"
                                                     pressedButtonImage:@"btn_right_nav_pressed@2x.png"
                                                         forNormalState:UIControlStateNormal
                                                        forPressedState:UIControlStateHighlighted
                                                                action:@selector(showMenuItemViewController)
                                                       forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *leftNavigationButton = [[UIBarButtonItem alloc]
                                             initWithCustomView:leftButtonCustomView];
    
    UIBarButtonItem *rightNavigationButton = [[UIBarButtonItem alloc]
                                             initWithCustomView:rightButtonCustomView];
    
    
    self.navigationItem.leftBarButtonItem = leftNavigationButton;
    self.navigationItem.rightBarButtonItem = rightNavigationButton;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Custom Methods

- (void)showMenuItemViewController{
    [menuItem presentedViewController];
}

- (UIButton *)createButtonWithNormalImage:(NSString *)imageNormalName
                       pressedButtonImage:(NSString *)imagePressedName
                           forNormalState:(UIControlState)normalState
                          forPressedState:(UIControlState)pressedState
                                   action:(SEL)action
                         forControlEvents:(UIControlEvents)event{
    
    UIImage *buttonNormalImage = [UIImage imageNamed:imageNormalName];
    UIImage *buttonPressedImage = [UIImage imageNamed:imagePressedName];
    
    UIButton *buttonCustomView = [UIButton buttonWithType:UIButtonTypeCustom];
    
    buttonCustomView.bounds = CGRectMake(0, 0,
                                              buttonNormalImage.size.width,
                                              buttonNormalImage.size.height);
    
    [buttonCustomView setImage:buttonNormalImage forState:normalState];
    [buttonCustomView setImage:buttonPressedImage forState:pressedState];
    
    [buttonCustomView
     addTarget:self
     action:action
     forControlEvents:event];
    
    return buttonCustomView;
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
