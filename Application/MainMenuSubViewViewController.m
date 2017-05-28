#import "MainMenuSubViewViewController.h"
#import "LeftNavigationMenu.h"

@interface MainMenuSubViewViewController () <LeftNavigatioNMenuProtocol>

@end

@implementation MainMenuSubViewViewController

@synthesize image1;
@synthesize image2;
@synthesize image3;
@synthesize image4;
@synthesize image5;
@synthesize image6;

@synthesize menuSubHeading;
@synthesize revealController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LeftNavigationMenu *rearView = [[LeftNavigationMenu alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearView];
    
    rearView.delegate = self;
    
    revealController = [self revealViewController];
    
    revealController.rearViewController = rearNavigationController;
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    
    [self.navigationController.navigationBar
    setBackgroundImage:[UIImage imageNamed:@"iphone_top_bar_bg@2x.png"]
    forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton *leftButtonCustomView = [self createButtonWithNormalImage:@"btn_left_nav_normal@2x.png"
                                                    pressedButtonImage:@"btn_left_nav_pressed@2x.png"
                                                        forNormalState:UIControlStateNormal
                                                       forPressedState:UIControlStateHighlighted
                                                                target:revealController
                                                                action:@selector(revealToggle:)
                                                      forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButtonCustomView = [self createButtonWithNormalImage:@"btn_right_nav_normal@2x.png"
                                                     pressedButtonImage:@"btn_right_nav_pressed@2x.png"
                                                         forNormalState:UIControlStateNormal
                                                        forPressedState:UIControlStateHighlighted
                                                                 target:revealController
                                                                 action:@selector(rightRevealToggle:)
                                                       forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *leftNavigationButton = [[UIBarButtonItem alloc]
                                             initWithCustomView:leftButtonCustomView];
    
    UIBarButtonItem *rightNavigationButton = [[UIBarButtonItem alloc]
                                              initWithCustomView:rightButtonCustomView];
    
//    UIBarButtonItem *rightRevealButtonItem = [[UIBarButtonItem alloc]
//                                              initWithImage:[UIImage imageNamed:@"reveal-icon.png"]
//                                              style:UIBarButtonItemStylePlain
//                                              target:revealController
//                                              action:@selector(rightRevealToggle:)];
//    
    
    self.navigationItem.leftBarButtonItem = leftNavigationButton;
    self.navigationItem.rightBarButtonItem = rightNavigationButton;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Custom Methods

- (UIButton *)createButtonWithNormalImage:(NSString *)imageNormalName
                       pressedButtonImage:(NSString *)imagePressedName
                           forNormalState:(UIControlState)normalState
                          forPressedState:(UIControlState)pressedState
                                   target:(nullable id)target
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
     addTarget:target
     action:action
     forControlEvents:event];
    
    return buttonCustomView;
}


#pragma mark - LeftNavigationMenuProtocolMethods

- (void)cellClicked:(NSString*)cellLabelValue withImages:(NSArray *)imageList{
    menuSubHeading.text = cellLabelValue;
    
    image1.image = [UIImage imageNamed:[imageList objectAtIndex:0]];
    image2.image = [UIImage imageNamed:[imageList objectAtIndex:1]];
    image3.image = [UIImage imageNamed:[imageList objectAtIndex:2]];
    image4.image = [UIImage imageNamed:[imageList objectAtIndex:3]];
    image5.image = [UIImage imageNamed:[imageList objectAtIndex:4]];
    image6.image = [UIImage imageNamed:[imageList objectAtIndex:5]];
    
    [revealController revealToggleAnimated:YES];
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
