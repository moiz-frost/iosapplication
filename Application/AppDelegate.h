#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SplashScreenViewController.h"

@class LoginController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginController *mainViewController;
@property (strong, nonatomic) SplashScreenViewController *splashScreenViewController;
@property (strong, nonatomic) UINavigationController *navigationMainController;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//
//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;


- (void)onSplashScreenDone;

@end

