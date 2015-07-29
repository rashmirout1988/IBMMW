//
//  Hierachy2ViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "Hierachy2ViewController.h"
#import "Hierachy3ViewController.h"
#import "Hierachy4ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "SlideOutMenuTableView.h"

#import "HierachyCollectionViewCell.h"
#import "AppDelegate.h"
#import "FooterTableView.h"
#define CASE(str)                       if ([__s__ isEqualToString:(str)])
#define SWITCH(s)                       for (NSString *__s__ = (s); ; )
#define DEFAULT

@interface UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations;
@end

@implementation UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskAll;
    
    
}
@end

@interface Hierachy2ViewController ()
{
    AppDelegate *delegate;
}

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slideOutMenuTableView;
@property (nonatomic, weak) IBOutlet ItemNavigation1 *itemNavigationView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;

@property (nonatomic, weak) IBOutlet  FooterView *footerView;
@property (nonatomic, weak) IBOutlet  FooterTableView *footerTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *footerTableViewHeightConstraint;

@property (nonatomic, weak) IBOutlet UICollectionView *itemCollectionView;
@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic,strong) NSString *selectedCellText;
@property (nonatomic,strong) NSString *currentCellBgImageName;
@property (nonatomic,strong) NSString *currentPortfolioName;
@end

@implementation Hierachy2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel2];
    [self.itemNavigationView setHierarchyNavigationBarItemImageForPortfolio:self.portfolioName];

    self.itemNavigationView.parantViewController = self;
    
    self.slideOutMenuTableView.parantViewController = self;
    self.footerView.currentViewController = self;
    self.footerView.footerTableView = self.footerTableView;
    self.footerView.footerTableViewHeightConstraints = self.footerTableViewHeightConstraint;
    self.footerTableView.parentViewController = self;
    delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    switch (self.portfolioName) {
        case Integration:
            NSLog(@"INTEGRATION");
            self.currentPortfolioName=@"integration";
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:138.0/255.0 blue:191.0/255.0 alpha:1.0];
            self.currentCellBgImageName=@"dpProductButton.png";
            
            if ([self.selectedItemAtHierachy1 isEqualToString:@"IBM Datapower Gateways"]) {
                self.itemArray = [delegate.IBMDatapowerGatewaysDictionary objectForKey:@"IBM Datapower Gateways"];
                [self.itemNavigationView.navigationButton3 setTitle:@"IBM Datapower Gateways" forState:UIControlStateNormal];
                
            }
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"IBM MQ"]) {
                self.itemArray = [delegate.OperationalDecMan objectForKey:@"IBM MQ"];
                [self.itemNavigationView.navigationButton3 setTitle:@"IBM MQ" forState:UIControlStateNormal];
            }
            
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"IBM Cast Iron"]) {
                self.itemArray = [delegate.OperationalDecMan objectForKey:@"IBM Cast Iron"];
                [self.itemNavigationView.navigationButton3 setTitle:@"IBM Cast Iron" forState:UIControlStateNormal];
            }
            
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"IBM Integration"]) {
                self.itemArray = [delegate.OperationalDecMan objectForKey:@"IBM Integration"];
                [self.itemNavigationView.navigationButton3 setTitle:@"IBM Integration" forState:UIControlStateNormal];
            }
            
            

            break;
            
         case SmarterProcess:
            NSLog(@"SMARTER PROCESS");
            self.currentPortfolioName=@"smarterProcess";
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
            self.currentCellBgImageName=@"productbutton.png";
            
            if ([self.selectedItemAtHierachy1 isEqualToString:@"Dicovery"]) {
                self.itemArray = [delegate.DiscoveryDictionary objectForKey:@"Discovery"];
                [self.itemNavigationView.navigationButton3 setTitle:@"Discovery" forState:UIControlStateNormal];
            }
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"Operational Decision Management"]) {
                self.itemArray = [delegate.OperationalDecMan objectForKey:@"Operational Decision Management"];
                [self.itemNavigationView.navigationButton3 setTitle:@"Operational Decision Management" forState:UIControlStateNormal];
            }
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"Business Process Management"]) {
                self.itemArray = [delegate.BusProcMan objectForKey:@"Business Process Management"];
                [self.itemNavigationView.navigationButton3 setTitle:@"Business Process Management" forState:UIControlStateNormal];
            }
            else if ([self.selectedItemAtHierachy1 isEqualToString:@"Operational Intelligence"]){
                self.itemArray = [delegate.OperationalIntelligence objectForKey:@"Operational Intelligence"];
                [self.itemNavigationView.navigationButton3 setTitle:@"Operational Intelligence" forState:UIControlStateNormal];
            }
            
            

            break;
        default:
            break;
    }
    
    NSLog(@"%@",self.selectedItemAtHierachy1);
    NSLog(@"the item array is %@",self.itemArray);
    
   // delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
}
    
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self checkOrientation];
    
    
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

- (void)viewWillLayoutSubviews {
    [self.itemCollectionView.collectionViewLayout invalidateLayout];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire = @"Cell";
    HierachyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
    cell.itemNameLabel.text = [self.itemArray objectAtIndex:indexPath.row];
    cell.bgImageView.image=[UIImage imageNamed:self.currentCellBgImageName];
    return cell;
}

#pragma mark - UICollectionView Delegate Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize cellSize = CGSizeMake(self.itemCollectionView.frame.size.width/2 - 20.0f, 46.0f);
    
    return cellSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCellText=[self.itemArray objectAtIndex:indexPath.row];
    NSLog(@"the selected value is %@",self.selectedCellText);
    if ([self.currentPortfolioName isEqualToString:@"integration"])
    {
        
        SWITCH(self.selectedCellText)  {
        CASE (@"API Management")
            {
                NSLog(@"API MANAGEMENT");
                break;
            }
            
        CASE (@"Integration")
            {
                NSLog(@"ENTERPRISE INTEGRATION");
                break;
            }
            
        CASE (@"Mainframe Integration & enablement")
            {
            NSLog(@"MAINFRAME INTEGRATION & ENABLEMENT");
            break;
            }
            
        CASE (@"Mobile Connectivity")
            {
            NSLog(@"MOBILE CONNECTIVITY");
            break;
            }
            
        CASE (@"Security & Optimization Gateway")
            {
            NSLog(@"SECURITY & OPTMIZATION GATEWAY");
            break;
            }
            
            DEFAULT
                break;
        }
        [self performSegueWithIdentifier:@"gotoHierachy4" sender:self];
        
    }
    else if ([self.currentPortfolioName isEqualToString:@"smarterProcess"])
    {
         [self performSegueWithIdentifier:@"gotoHierachy3" sender:self];
    }
   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"gotoHierachy4"])
    {
        Hierachy4ViewController *hierachyObject4=[segue destinationViewController];
        hierachyObject4.portfolioName=self.portfolioName;

    }
    else
    {
        Hierachy3ViewController *hierachyObject3=[segue destinationViewController];
        hierachyObject3.scenario=self.selectedCellText;
        hierachyObject3.productName=self.selectedItemAtHierachy1;
        hierachyObject3.portfolioName=self.portfolioName;
        
    }
   
}


@end
