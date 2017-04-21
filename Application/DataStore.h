//
//  DataStore.h
//  Application
//
//  Created by Abdul Moiz on 21/04/2017.
//  Copyright © 2017 2plebs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataStore : NSObject{
    NSManagedObjectModel *model;
}


@property (nonatomic, strong) NSManagedObjectContext *context;

- (NSURL *)pathForDocumentsFile:(NSString *)filename;
+ (id)sharedDataStorage;
- (BOOL)saveChanges;

 
@end
