//
//  ItemNavigation1.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "ItemNavigation1.h"

@interface ItemNavigation1 ()

@property (nonatomic) HierarchyLevel hierarchyLevel;
@property (nonatomic) PortfolioName portfolioName;

- (IBAction)changeHierarchy:(UIButton *)sender;

@end

@implementation ItemNavigation1


- (void)awakeFromNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"ItemNavigation1" owner:self options:nil];
    [self addSubview:self.contentView];
   // [self.navigationButton1 setTitle:@"Smarter Process" forState:UIControlStateNormal];
    //[self.navigationButton2 setTitle:@"Products" forState:UIControlStateNormal];
    //[self.navigationButton3 setTitle:@"Discovery" forState:UIControlStateNormal];
    //[self.navigationButton4 setTitle:@"IBM Blueworks live" forState:UIControlStateNormal];
}

- (void)setHierarchyNavigationBarForLevel:(int)levelNumber {
    
    self.hierarchyLevel = levelNumber;
    
    switch (levelNumber) {
        case HierarchyLevel1:
            self.navigationButton3.hidden = YES;
            self.navigationButton4.hidden = YES;
            self.navigationButton5.hidden = YES;
            break;
            
        case HierarchyLevel2:
            self.navigationButton4.hidden = YES;
            self.navigationButton5.hidden = YES;
            break;
            
        case HierarchyLevel3:
            self.navigationButton5.hidden = YES;
            break;
            
        case HierarchyLevel4:
            break;
            
        default:
            self.hidden = YES;
            break;
    }
}

- (void)setHierarchyNavigationBarItemImageForPortfolio:(int)portfolioName {
    
    self.portfolioName = portfolioName;
    switch (portfolioName) {
            
        case ApplicationPlatform:
            
            break;
            
        case Integration:
            [self changeButtonBackgroundImage:@"dp_tabbar.png"];
            [self.navigationButton1 setTitle:@"Integration" forState:UIControlStateNormal];
            [self.navigationButton2 setTitle:@"Products" forState:UIControlStateNormal];
            break;
            
        case SmarterProcess:
            [self changeButtonBackgroundImage:@"tabbar.png"];
            [self.navigationButton1 setTitle:@"Smarter Process" forState:UIControlStateNormal];
            [self.navigationButton2 setTitle:@"Capabilities" forState:UIControlStateNormal];

            
            break;
            
        case DigitalExperience:
            
            break;
            
        ItServiceManagement:
            
            break;
            
        default:
            break;
    }
}

- (void)changeButtonBackgroundImage:(NSString *)imageName {
    
    [self.navigationButton1 setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.navigationButton2 setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.navigationButton3 setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.navigationButton4 setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.navigationButton5 setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];

}


- (void)changeHierarchy:(UIButton *)sender {
    
    int hierarchyLevelTaped = sender.tag - 5000;
    
    if (self.hierarchyLevel != hierarchyLevelTaped) {
        
        [self.parantViewController.navigationController popToViewController:[self.parantViewController.navigationController.viewControllers objectAtIndex:(self.parantViewController.navigationController.viewControllers.count - (self.hierarchyLevel - hierarchyLevelTaped) - 1)] animated:NO];
    }
}

@end
