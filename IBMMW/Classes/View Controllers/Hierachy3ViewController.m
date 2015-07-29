//
//  Hierachy3ViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "Hierachy3ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "SlideOutMenuTableView.h"
#import "FooterTableView.h"
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

@interface Hierachy3ViewController ()

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (nonatomic, weak) IBOutlet FooterView *footerView;
@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slideOutMenuTableView;
@property (nonatomic, weak) IBOutlet ItemNavigation1 *itemNavigationView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;


@property (nonatomic, weak) IBOutlet  FooterTableView *footerTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *footerTableViewHeightConstraint;


@end

@implementation Hierachy3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"usecase name is %@",_scenario);
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [self.itemNavigationView.navigationButton4 setTitle:_scenario forState:UIControlStateNormal];
    [self.itemNavigationView.navigationButton3 setTitle:_productName forState:UIControlStateNormal];
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
  //  self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel3];
    [self.itemNavigationView setHierarchyNavigationBarItemImageForPortfolio:self.portfolioName];

    self.itemNavigationView.parantViewController = self;
    
    self.slideOutMenuTableView.parantViewController = self;
    
    self.footerView.currentViewController = self;
    self.footerView.footerTableView = self.footerTableView;
    self.footerView.footerTableViewHeightConstraints = self.footerTableViewHeightConstraint;
    self.footerTableView.parentViewController = self;

    twoFingerPinch = [[UIPinchGestureRecognizer alloc]
                      initWithTarget:self
                      action:@selector(twoFingerPinch:)];
    [_useCaseImage addGestureRecognizer:twoFingerPinch];
    
    switch (self.portfolioName) {
        case Integration:
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:138.0/255.0 blue:191.0/255.0 alpha:1.0];

            break;
            
        case SmarterProcess:
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
            if([_scenario isEqualToString:@"IBM Blueworks Live"])
            {
                _useCaseImage.image=[UIImage imageNamed:@"blueworkslive.png"];
                
            }
            else if ([_scenario isEqualToString:@"IBM Operational Decision Manager"])
            {
                _useCaseImage.image=[UIImage imageNamed:@"operationaldecisionmanager.png"];
                
            }
            else if ([_scenario isEqualToString:@"IBM Business Process Manager"])
            {
                _useCaseImage.image=[UIImage imageNamed:@"IBMBusinessprocessmanager.png"];
                
            }
            else if ([_scenario isEqualToString:@"IBM Business Monitor"])
            {
                
                _useCaseImage.image=[UIImage imageNamed:@"IBMBusinessMonitor.png"];
                
            }
            else{
                
                _useCaseImage.image=[UIImage imageNamed:@""];
            }

            break;
            
        default:
            break;
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [self checkOrientation];
    [super viewWillAppear:YES];
    
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


- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    //    NSLog(@"Pinch scale: %f", recognizer.scale);
    if (recognizer.scale >1.0f && recognizer.scale < 2.5f) {
        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
        _useCaseImage.transform = transform;
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
