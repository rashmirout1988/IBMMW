//
//  HeaderView.m
//  IBMMW
//
//  Created by apple on 13/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "HeaderView.h"


@interface HeaderView () {
    
    BOOL isSlideOutMenuVisible;
}

- (IBAction)goToHome:(UIButton *)sender;
- (IBAction)clikedMenuButton:(UIButton *)sender;

@end

@implementation HeaderView

- (void)awakeFromNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    [self addSubview:self.contentView];
    
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SlideOutMenuClicked" object:nil];
    }
}

- (void)didMoveToWindow {
    if (self.window) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clikedMenuButton:) name:@"SlideOutMenuClicked" object:nil];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SlideOutMenuClicked" object:nil];
}

- (void)goToHome:(UIButton *)sender {
    [self.currentViewController.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)clikedMenuButton:(UIButton *)sender {

    float widthOfSlideOutMenu;
    float xPosition;
    if (isSlideOutMenuVisible) {
        widthOfSlideOutMenu = 0.0f;
        xPosition = self.currentViewController.view.bounds.size.width;
        self.menuTableViewWidthConstraints.constant = 0.0f;
        isSlideOutMenuVisible = NO;
    }
    else {
        widthOfSlideOutMenu = 320.0f;
        xPosition = self.currentViewController.view.bounds.size.width - 320.0f;
        self.menuTableViewWidthConstraints.constant = 320.0f;
        isSlideOutMenuVisible = YES;
    }
    [UIView animateWithDuration:0.2f animations:^{
        self.menuTableView.frame = CGRectMake(xPosition, 64.0f, widthOfSlideOutMenu, self.menuTableView.bounds.size.height);
    }];
}

@end
