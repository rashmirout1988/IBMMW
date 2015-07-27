//
//  LoginViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/25/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "LoginViewController.h"

@interface UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations;
@end

@implementation UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskAll;
    
    
}
@end

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
     [self checkOrientation];
    [super viewWillAppear:YES];
    
   
    
}

-(void)changeOrientationPortrait_iPad
{
    
    //loginComponentsView.frame = CGRectMake(193, 408, 383, 207);
   // imgIBMLogo.frame = CGRectMake(672, 975, 73, 29);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg_portrait.png"]];
//    _usernameTextField.frame=CGRectMake(223.0,420.0, 319.0, 50.0);
//    _passwordTextfield.frame=CGRectMake(223.0,500.0, 319.0, 50.0);
   // loginButton.frame=CGRectMake(800.0, 600.0, 131.0, 45.0);
    
}

-(void)changeOrientationLandscape_iPad
{
    
    //loginComponentsView.frame = CGRectMake(321, 280, 383, 207);
   // imgIBMLogo.frame = CGRectMake(930, 720, 73, 29);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg_landscape.png"]];
//    _usernameTextField.frame=CGRectMake(373.0,320.0, 319.0, 50.0);
//    _passwordTextfield.frame=CGRectMake(373.0,400.0, 319.0, 50.0);
  //_loginButton.frame=CGRectMake(700.0, 500.0, 131.0, 45.0);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)orientationChanged:(NSNotification *)notification

{
    [self checkOrientation];
}

-(void) checkOrientation
{
    
  //  UIDeviceOrientation orienation = [[UIDevice currentDevice] orientation];
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if(orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight)
    {
        //  NSLog(@"landscape");
        
        [self changeOrientationLandscape_iPad];
    }
    else
    {
        // NSLog(@"potrait");
        
        [self changeOrientationPortrait_iPad];
    }
    
    
    
    
    
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
    [self checkOrientation];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation ==UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return YES;
    }
    
    return NO;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
