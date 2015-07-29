//
//  ItemNavigation1.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HierarchyLevel1 = 2,
    HierarchyLevel2,
    HierarchyLevel3,
    HierarchyLevel4,
} HierarchyLevel;

typedef enum : NSUInteger {
    
    ApplicationPlatform = 1,
    Integration,
    SmarterProcess,
    DigitalExperience,
    ItServiceManagement,
} PortfolioName;

@interface ItemNavigation1 : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UIButton *navigationButton1;
@property (nonatomic, weak) IBOutlet UIButton *navigationButton2;
@property (nonatomic, weak) IBOutlet UIButton *navigationButton3;
@property (nonatomic, weak) IBOutlet UIButton *navigationButton4;
@property (nonatomic, weak) IBOutlet UIButton *navigationButton5;
@property (nonatomic, weak) UIViewController *parantViewController;

- (void)setHierarchyNavigationBarForLevel:(int)levelNumber;
- (void)setHierarchyNavigationBarItemImageForPortfolio:(int)portfolioName;
@end
