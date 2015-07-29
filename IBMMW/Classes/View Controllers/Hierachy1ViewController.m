//
//  PortfolioViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 6/25/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "Hierachy1ViewController.h"
#import "HomeViewController.h"
#import "HeaderView.h"
#import "ItemNavigation1.h"
#import "HierachyCollectionViewCell.h"
#import "AppDelegate.h"
#import "Hierachy2ViewController.h"
#import "FooterTableView.h"
#import "FooterView.h"
@interface UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations;
@end

@implementation UINavigationController (RotationAll)
-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskAll;
    
    
}
@end


@interface Hierachy1ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
  
}
@property (weak, nonatomic) IBOutlet UILabel *productLabel;

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (nonatomic, weak) IBOutlet ItemNavigation1 *item1;
@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slidOutTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;
@property (nonatomic, weak) IBOutlet FooterView *footerView;
@property (nonatomic, weak) IBOutlet  FooterTableView *footerTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *footerTableViewHeightConstraint;
@property (nonatomic, strong) NSArray *itemArray;

@property (nonatomic, weak) IBOutlet UICollectionView *itemCollectionView;

@property (nonatomic, strong) NSString *selectedItem;
@property (nonatomic, strong) NSString *currentCellBgImageName;

@end

@implementation Hierachy1ViewController {
    AppDelegate *delegate;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slidOutTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    
    

    [self.item1 setHierarchyNavigationBarForLevel:HierarchyLevel1];
    [self.item1 setHierarchyNavigationBarItemImageForPortfolio:self.portfolioName];
    
    self.item1.parantViewController = self;
    self.slidOutTableView.parantViewController = self;
    
    self.footerView.currentViewController = self;
    self.footerView.footerTableView = self.footerTableView;
    self.footerView.footerTableViewHeightConstraints = self.footerTableViewHeightConstraint;
    self.footerTableView.parentViewController = self;
    delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    switch (self.portfolioName) {
        case Integration:
            NSLog(@"INTEGRATION");
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:138.0/255.0 blue:191.0/255.0 alpha:1.0];
            self.itemArray = delegate.integrationPortfolioProducts;
            self.productLabel.text = @"List of Products";
            [self.item1.navigationButton1 setTitle:@"Integration" forState:UIControlStateNormal];
            [self.item1.navigationButton2 setTitle:@"Products" forState:UIControlStateNormal];
            
            self.currentCellBgImageName=@"dpProductButton.png";

            break;
            
        case SmarterProcess:
            NSLog(@"SMARTER PROCESS");
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
            self.itemArray = delegate.smarterProcessPortfolioProducts;
            self.productLabel.text = @"List of Capabilities";
            [self.item1.navigationButton1 setTitle:@"Smarter Process" forState:UIControlStateNormal];
            
            [self.item1.navigationButton2 setTitle:@"Capabilities" forState:UIControlStateNormal];
            self.currentCellBgImageName=@"productbutton.png";
            
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
    
    self.selectedItem = [self.itemArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"gotoHierachy2" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    Hierachy2ViewController *hierachy2VC = (Hierachy2ViewController *)[segue destinationViewController];
    hierachy2VC.selectedItemAtHierachy1 = self.selectedItem;
    hierachy2VC.portfolioName=self.portfolioName;
}


@end
