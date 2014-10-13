//
//  AppDelegate.m
//  MyLocations
//
//  Created by jfl913 on 14-4-27.
//  Copyright (c) 2014年 jfl913. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "CurrentLocationViewController.h"
#if DEBUG
// FLEX should only be compiled and used in debug builds.
#import "FLEXManager.h"
#endif

@interface AppDelegate ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
#if DEBUG
    // This call shows the FLEX toolbar if it's not already shown.
    [[FLEXManager sharedManager] showExplorer];
#endif
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    CurrentLocationViewController *currentLocationViewController = tabBarController.viewControllers[0];
    currentLocationViewController.managedObjectContext = self.managedObjectContext;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Core Data
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DataModel" ofType:@"momd"];
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:fileUrl];
    }
    
    return _managedObjectModel;
}

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];
    return documentsDirectory;
}

- (NSString *)dataStorePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"DataStore.sqlite"];
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator == nil) {
        NSError *error;
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:[self dataStorePath]] options:nil error:&error]) {
            NSLog(@"Error adding persistent store: %@, %@", error, error.userInfo);
            abort();
        }
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext == nil) {
        if (self.persistentStoreCoordinator) {
            _managedObjectContext = [[NSManagedObjectContext alloc] init];
            [_managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        }
    }
    
    return _managedObjectContext;
}

@end
