#import "DataStore.h"
#import "FileSystemHelper.h"


@implementation DataStore

@synthesize context;

- (NSURL *)pathForDocumentsFile:(NSString *)filename {
    
    // create a URL-based path to the passed in filename located in the Documents directory
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directories = [fm URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *documentPath = [directories objectAtIndex:0];
    
    return [documentPath URLByAppendingPathComponent:filename];
    
}

+ (id) sharedDataStorage {
    
    static DataStore *sharedDataStore = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedDataStore = [[self alloc] init];
    });
    
    return sharedDataStore;
}


- (id)init
{
    self = [super init];
    if (self) {
        
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]
                                             initWithManagedObjectModel:model];
        
        // create a URL-based path to the passed in filename located in the Documents directory
        NSURL *dataStoreURL = [FileSystemHelper pathForDocumentsFile:@"datastore.sqlite"];
        
        // start with a clean slate each time the app starts
//        [[NSFileManager defaultManager] removeItemAtURL:dataStoreURL
//                                                  error:nil];
        
        NSError *error = nil;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:dataStoreURL
                                     options:nil
                                       error:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        // Create the managed object context
        context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [context setPersistentStoreCoordinator:psc];
    }
    return self;
}

- (BOOL)saveChanges {
    
    NSError *error = nil;
    BOOL saveSuccessful = [context save:&error];
    if (!saveSuccessful) {
        NSLog(@"An error occurred while saving data. Error: %@", [error localizedDescription]);
    }
    return saveSuccessful;
}

@end
