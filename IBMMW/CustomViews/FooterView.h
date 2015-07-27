//
//  FooterView.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/13/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FooterTableView.h"
#import <MessageUI/MessageUI.h>

@interface FooterView : UIView<MFMailComposeViewControllerDelegate>
- (IBAction)portfolioNavigateButton:(UIButton *)sender;
- (IBAction)sendMail:(id)sender;

@property (nonatomic, weak) UIViewController *currentViewController;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, weak) FooterTableView *footerTableView;
@property (nonatomic, weak) NSLayoutConstraint *footerTableViewHeightConstraints;



@end
