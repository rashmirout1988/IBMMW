//
//  AppDelegate.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/24/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    // Override point for customization after application launch.
//   // self.window.rootViewController = self.viewController;
//    
//    [self.window makeKeyAndVisible];
//    
//    [self.window setFrame:[[UIScreen mainScreen] bounds]];
//    
//    /*
//    for (NSString* family in [UIFont familyNames])
//    {
//        NSLog(@"%@", family);
//        
//        for (NSString* name in [UIFont fontNamesForFamilyName: family])
//        {
//            NSLog(@"  %@", name);
//        }
//    }
//     */
    [self createDataLevel];
    
    return YES;
    
}

-(void)createDataLevel
{
    /*
    _portfolioDictionary=[[NSMutableDictionary alloc]init];
    NSMutableArray *portfolioProducts=[[NSMutableArray alloc]init];
    NSMutableArray *capablities;
    
    
    [portfolioProducts addObjectsFromArray:[NSArray arrayWithObjects:@"Discovery",@"Operational Decision Management",@"Business Process Management",@"Operational Intelligence", nil]];
    [_portfolioDictionary setObject:portfolioProducts forKey:@"Smarter Process"];
    
    [portfolioProducts removeAllObjects];
    [portfolioProducts addObjectsFromArray:[NSArray arrayWithObjects:@"IBM Integration Bus",@"IBM MQ",@"IBM Datapower Gateways",@"IBM Cast Iron", nil]];
    [_portfolioDictionary setObject:portfolioProducts forKey:@"Integration"];
    
     for(NSString *key in _portfolioDictionary)
     {
         
         capablities=[_portfolioDictionary objectForKey:key];
         _capabilityDictionary=[[NSMutableDictionary alloc]init];

    if([key isEqualToString:@"Integration"])
        {
         for(int i=0;i<capablities.count;i++)
         {
            // NSLog(@"the Product for key %@ is %@",[capablities objectAtIndex:i],key);
                          if([[capablities objectAtIndex:i] isEqualToString:@"IBM Datapower Gateways"])
                {
                  [_capabilityDictionary setObject:@[@"Security & Optimization Gateway",@"Mobile Connectivity",@"API Management",@"Integration",@"Mainframe Integration & Enablement",@"B2B"] forKey:[capablities objectAtIndex:i]];
                }
             
         }
      }
         else if ([key isEqualToString:@"Smarter Process"])
         {
             for(int i=0;i<capablities.count;i++)
             {
                 
            if ([[capablities objectAtIndex:i] isEqualToString:@"Discovery"])
             {
                 [_capabilityDictionary setObject:@[@"IBM Blueworks live"] forKey:[capablities objectAtIndex:i]];
             }
             else if ([[capablities objectAtIndex:i] isEqualToString:@"Operational Decision Management"])
             {
                 [_capabilityDictionary setObject:@[@"IBM Operational Decision Manager"] forKey:[capablities objectAtIndex:i]];
             }
             else if ([[capablities objectAtIndex:i] isEqualToString:@"Business Process Management"])
             {
                 [_capabilityDictionary setObject:@[@"IBM Business Process Manager",@"Case Management Framework"] forKey:[capablities objectAtIndex:i]];
             }
             else if ([[capablities objectAtIndex:i] isEqualToString:@"Operational Intelligence"])
             {
                 [_capabilityDictionary setObject:@[@"IBM Business Monitor"] forKey:[capablities objectAtIndex:i]];
             }
             }
             
         }
         
     }
    
    NSLog(@"Porfolio dictionary-->>%@",_portfolioDictionary);
    NSLog(@"Capabilities dictionary-->>%@",_capabilityDictionary);
     */
  //  NSMutableArray *portfolioArray=[[NSMutableArray alloc]initWithObjects:@"Application Platform",@"Integration",@"Smarter Process",@"Digital Experience",@"IT Service Management",nil];
    
    self.integrationPortfolioProducts = [[NSMutableArray alloc]initWithObjects:@"IBM Integration",@"IBM MQ",@"IBM Datapower Gateways",@"IBM Cast Iron", nil];
    
    self.smarterProcessPortfolioProducts = [[NSMutableArray alloc]initWithObjects:@"Dicovery",@"Operational Decision Management",@"Business Process Management",@"Operational Intelligence", nil];
    
    self.IBMDatapowerGatewaysDictionary = [[NSMutableDictionary alloc] init];
    [self.IBMDatapowerGatewaysDictionary setObject:@[@"Security & Optimization Gateway",@"Mobile Connectivity",@"API Management",@"Integration",@"Mainframe Integration & Enablement",@"B2B"] forKey:@"IBM Datapower Gateways"];
    
    self.DiscoveryDictionary = [[NSMutableDictionary alloc] init];
    [self.DiscoveryDictionary setObject:@[@"IBM Blueworks Live"] forKey:@"Discovery"];
    
    self.OperationalDecMan = [[NSMutableDictionary alloc] init];
    [self.OperationalDecMan setObject:@[@"IBM Operational Decision Manager"] forKey:@"Operational Decision Management"];
    
    self.BusProcMan = [[NSMutableDictionary alloc] init];
    [self.BusProcMan setObject:@[@"IBM Business Process Manager",@"Case Management Framework"] forKey:@"Business Process Management"];

    self.OperationalIntelligence = [[NSMutableDictionary alloc] init];
    [self.OperationalIntelligence setObject:@[@"IBM Business Monitor"] forKey:@"Operational Intelligence"];
    
    NSLog(@"Data insertions over");
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.IBM.IBMMW" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"IBMMW" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"IBMMW.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
