//
//  HeaderView.h
//  IBMMW
//
//  Created by apple on 13/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideOutMenuTableView.h"

@interface HeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UIButton *homeButton;
@property (nonatomic, weak) IBOutlet UIImageView *seperatorImageView;
@property (nonatomic, weak) IBOutlet UIButton *menuButton;
@property (nonatomic, weak) IBOutlet UIButton *searchButton;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;

@property (nonatomic, weak) UIViewController *currentViewController;
@property (nonatomic, weak) SlideOutMenuTableView *menuTableView;
@property (nonatomic, weak) NSLayoutConstraint *menuTableViewWidthConstraints;

@end
