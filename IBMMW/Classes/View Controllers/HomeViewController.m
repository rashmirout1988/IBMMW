//
//  ViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/24/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

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


@interface HomeViewController () {
    
    AppDelegate *appDelegate;
}

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
-(IBAction)selectPorfolio:(UIButton *)sender;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headerView.homeButton removeFromSuperview];
    [self.headerView.seperatorImageView removeFromSuperview];
    [self.headerView.searchButton removeFromSuperview];
    [self.headerView.menuButton removeFromSuperview];
    _applicationPlatform.alpha=0;
    _integration.alpha=0;
    _smarterProcess.alpha=0;
    _digitalExperience.alpha=0;
    _itServiceManagement.alpha=0;

    
    [self animateGIFImage];
    
    _profileImage.layer.cornerRadius = _profileImage.frame.size.width/2;
    _profileImage.layer.masksToBounds = YES;

    
    
    [_applicationPlatform setImage:[UIImage imageNamed:@"application-platform.png"]
              forState:UIControlStateHighlighted];
    [_integration setImage:[UIImage imageNamed:@"integration.png"]
              forState:UIControlStateHighlighted];
    [_smarterProcess setImage:[UIImage imageNamed:@"smarterprocess.png"]
              forState:UIControlStateHighlighted];
    [_digitalExperience setImage:[UIImage imageNamed:@"digital-experience.png"]
              forState:UIControlStateHighlighted];
    [_itServiceManagement setImage:[UIImage imageNamed:@"itservice-management.png"]
              forState:UIControlStateHighlighted];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self checkOrientation];
    [super viewWillAppear:YES];
    
}
-(void)animateGIFImage
{
    
    @try {
        
        NSMutableArray *animationImagesArray = [NSMutableArray array];
        for (int i = 1; i <= 30; i++) {
            [animationImagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"graphicsgif%d.png",i]]];
        }
        _activityImageView.animationImages = animationImagesArray;
        
        [_activityImageView setAnimationRepeatCount:-1];
        [_activityImageView setAnimationDuration:3.0f];
       // [_activityImageView setAnimationRepeatCount:1];
        [_activityImageView startAnimating];
         [self performSelector:@selector(stopTheAnimation) withObject:nil afterDelay:3.0f];
       // [_activityImageView setImage:[UIImage imageNamed:@"GRAPHICS13.png"]];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    
      

}
-(void) stopTheAnimation {
    [_activityImageView stopAnimating];
    [_activityImageView setImage:[UIImage imageNamed:@"GRAPHICS13.png"]];
    _applicationPlatform.alpha=1;
    _integration.alpha=1;
    _smarterProcess.alpha=1;
    _digitalExperience.alpha=1;
    _itServiceManagement.alpha=1;

}
-(void)changeOrientationPortrait_iPad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_portrait.png"]];
}

-(void)changeOrientationLandscape_iPad
{

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01.png"]];
    
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

- (void)selectPorfolio:(UIButton *)sender {
    
    switch (sender.tag) {
        case 5001:
            
            break;
            
        case 5002:
            appDelegate.selectedPortfolio = @"integration";
            [self performSegueWithIdentifier:@"goToPASG" sender:self];
            break;
            
        case 5003:
            appDelegate.selectedPortfolio = @"smarterProcess";
            [self performSegueWithIdentifier:@"goToPASG" sender:self];
            break;
            
        case 5004:
            
            break;
            
        case 5005:
            
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
