//
//  FooterTableView.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/22/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FooterTableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *footerTableView;
@property (weak, nonatomic) UIViewController *parentViewController;
@end
