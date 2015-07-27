//
//  SlideOutMenuTableView.h
//  IBMMW
//
//  Created by apple on 14/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem1ViewController.h"

@interface SlideOutMenuTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *slideOutTableView;
@property (nonatomic, weak) UIViewController *parantViewController;

+ (void)setCurrentSelectedIndex:(int)index;
+ (int)getCurrentIndex;

@end
