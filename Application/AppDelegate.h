#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SplashScreenViewController.h"
#import "SWRevealViewController.h"

@class LoginController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>



# pragma mark - Properties

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginController *loginViewController;
@property (strong, nonatomic) SplashScreenViewController *splashScreenViewController;
@property (strong, nonatomic) UINavigationController *frontNavigationViewController;
@property (strong, nonatomic) UINavigationController *rearNavigationViewController;
@property (strong, nonatomic) SWRevealViewController *mainRevealViewController;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;


- (void)onSplashScreenDone;

@end

