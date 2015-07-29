//
//  PA&SAViewController.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/3/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideOutMenuTableView.h"
#import "ItemNavigation1.h"


@interface PG_SAViewController : UIViewController

@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slidOutTableView;

@property (nonatomic) PortfolioName portfolioName;

@end
