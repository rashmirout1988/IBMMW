//
//  AppDelegate.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/24/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSMutableDictionary *portfolioDictionary;
@property (strong,nonatomic)NSMutableDictionary *capabilityDictionary;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
//////////These objects need to be remove later.//////////////
@property (strong, nonatomic) NSString *contentText;
@property (strong, nonatomic) NSString *selectedPortfolio;
@property (nonatomic, strong) NSMutableArray *integrationPortfolioProducts;
@property (nonatomic, strong) NSMutableArray *smarterProcessPortfolioProducts;
@property (nonatomic, strong) NSMutableDictionary *IBMDatapowerGatewaysDictionary;
@property (nonatomic, strong) NSMutableDictionary *DiscoveryDictionary;
@property (nonatomic, strong) NSMutableDictionary *OperationalDecMan;
@property (nonatomic, strong) NSMutableDictionary *BusProcMan;
@property (nonatomic, strong) NSMutableDictionary *OperationalIntelligence;


////////

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

