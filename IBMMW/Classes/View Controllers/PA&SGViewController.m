//
//  PA&SAViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/3/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "PA&SGViewController.h"
#import "HomeViewController.h"
#import "HeaderView.h"
#import "AppDelegate.h"
@interface UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations;
@end

@implementation UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskAll;
    
    
}
@end


@interface PG_SAViewController ()
{
    AppDelegate *appDelegate;
}

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;
@property (weak, nonatomic) IBOutlet UIButton *productBasicsButton;
@property (weak, nonatomic) IBOutlet UIButton *SalesAidButton;

@end

@implementation PG_SAViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slidOutTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    self.slidOutTableView.parantViewController = self;
    appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if([appDelegate.selectedPortfolio isEqualToString:@"integration"])
    {
        self.headerView.contentView.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:138.0/255.0 blue:191.0/255.0 alpha:1.0];
        [self.productBasicsButton setImage:[UIImage imageNamed:@"dpProbasic.png"] forState:UIControlStateNormal];
        [self.SalesAidButton setImage:[UIImage imageNamed:@"dpSaguide.png"] forState:UIControlStateNormal];
        
    }
    else if([appDelegate.selectedPortfolio isEqualToString:@"smarterProcess"])
    {
        
       self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
       [self.productBasicsButton setImage:[UIImage imageNamed:@"productbasics.png"] forState:UIControlStateNormal];
       [self.SalesAidButton setImage:[UIImage imageNamed:@"salesaid.png"] forState:UIControlStateNormal];

        
    }
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self checkOrientation];
    [SlideOutMenuTableView setCurrentSelectedIndex:-1];
}
-(void)changeOrientationPortrait_iPad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_portrait.png"]];
}

-(void)changeOrientationLandscape_iPad
{
    
    //loginComponentsView.frame = CGRectMake(321, 280, 383, 207);
    // imgIBMLogo.frame = CGRectMake(930, 720, 73, 29);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01.png"]];
    //    _usernameTextField.frame=CGRectMake(373.0,320.0, 319.0, 50.0);
    //    _passwordTextfield.frame=CGRectMake(373.0,400.0, 319.0, 50.0);
    //_loginButton.frame=CGRectMake(700.0, 500.0, 131.0, 45.0);
    
}

- (void)orientationChanged:(NSNotification *)notification

{
    [self checkOrientation];
}

-(void) checkOrientation
{
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
