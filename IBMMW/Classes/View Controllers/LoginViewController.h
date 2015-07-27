//
//  LoginViewController.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/25/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
  //  IBOutlet UIButton *loginButton;
}

@property(nonatomic,weak)IBOutlet UITextField *usernameTextField;
@property(nonatomic,weak)IBOutlet UITextField *passwordTextfield;
//@property(nonatomic,weak)IBOutlet UIButton *loginButton;

@end
