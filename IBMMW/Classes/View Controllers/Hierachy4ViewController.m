//
//  Hierachy4ViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "Hierachy4ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "SlideOutMenuTableView.h"
#import "HierachyCollectionViewCell.h"
#import "Hierachy3ViewController.h"
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

@interface Hierachy4ViewController ()

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (nonatomic, weak) IBOutlet FooterView *footerView;
@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slideOutMenuTableView;
@property (nonatomic, weak) IBOutlet ItemNavigation1 *itemNavigationView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;
@property (nonatomic, weak) IBOutlet UICollectionView *itemCollectionView;
@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic, strong) NSMutableArray *useCaseImageArray;
@property (nonatomic,strong) NSString *currentCellBgImageName;
@property (nonatomic ,strong) NSString *nextViewUseCaseImageString;
@property (nonatomic ,strong) NSString *nextViewUseCaseTitle;
@end

@implementation Hierachy4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    self.itemNavigationView.parantViewController = self;
    self.slideOutMenuTableView.parantViewController = self;
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel3];
    [self.itemNavigationView setHierarchyNavigationBarItemImageForPortfolio:self.portfolioName];
    switch (self.portfolioName) {
        case Integration:
            NSLog(@"INTEGRATION");
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:0.0/255.0 green:138.0/255.0 blue:191.0/255.0 alpha:1.0];
            self.currentCellBgImageName=@"dpProductButton.png";
            [self.itemNavigationView.navigationButton3 setTitle:self.selectedProduct forState:UIControlStateNormal];
            [self.itemNavigationView.navigationButton4 setTitle:self.selectedCapability forState:UIControlStateNormal];
            break;
        case SmarterProcess:
            NSLog(@"SMARTER PROCESS");
            self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
            self.currentCellBgImageName=@"productButton.png";
            break;
            
        default:
            break;
    }
    NSLog(@"the selected capability is %@",self.selectedCapability);
    SWITCH(self.selectedCapability)
    {
        CASE (@"API Management")
        {
            NSLog(@"API MANAGEMENT");
            self.useCaseImageArray = [NSMutableArray array];
            self.itemArray=@[@"IBM API Management V2.0",@"Secure Mobile App Integration + API Management"];
            for(int i=1;i<=2;i++)
            {
                [self.useCaseImageArray addObject:[NSString stringWithFormat:@"api%d.png",i]];
            }
            
            break;
        }
        
        CASE (@"Integration")
        {
            NSLog(@"ENTERPRISE INTEGRATION");
            self.useCaseImageArray = [NSMutableArray array];
            self.itemArray=@[@"Content-Based Routing",@"Transport Protocol Translation",@"Integration",@"UK Government Agency",@"Security & Integration Scenario – Financial Firm"];
            for(int i=1;i<=5;i++)
            {
                [self.useCaseImageArray addObject:[NSString stringWithFormat:@"ei%d.png",i]];
            }

            break;
        }
        
        CASE (@"Mainframe Integration & Enablement")
        {
            NSLog(@"MAINFRAME INTEGRATION & ENABLEMENT");
            self.useCaseImageArray = [NSMutableArray array];

            self.itemArray=@[@"Broad integration with System z",@"Enhanced value for System z & IMS",@"An Irish Bank",@"High Street Clothing and Fashion Accessories Retailer",@"Web Services Security and Management for IMS Web Services",@"Web Services Enablement for IMS-based Services",@"Web Services Enablement for IMS-based Services",@"IMS Connect Reverse Proxy",@"DB2 Integration",@"Web Services Security and Management for CICS Web Services",@"Web Services Enablement for CICS Applications"];
            for(int i=1;i<=11;i++)
            {
                [self.useCaseImageArray addObject:[NSString stringWithFormat:@"me%d.png",i]];
            }

            break;
        }
        
        CASE (@"Mobile Connectivity")
        {
            NSLog(@"MOBILE CONNECTIVITY");
            self.useCaseImageArray = [NSMutableArray array];

            self.itemArray=@[@"Connect Mobile Apps with Enterprise Apps & Services",@"A closer look at some Mobile Connectivity scenarios",@"Sprint leverages IBM DataPower appliances to rapidly & securely grow revenue",@"Client examples using DataPower for Mobile use cases"];
            for(int i=1;i<=4;i++)
            {
                [self.useCaseImageArray addObject:[NSString stringWithFormat:@"mc%d.png",i]];
            }
            

            break;
        }
        
        CASE (@"Security & Optimization Gateway")
        {
            NSLog(@"SECURITY & OPTMIZATION GATEWAY");
            self.useCaseImageArray = [NSMutableArray array];
            self.itemArray=@[@"DataPower security roles and objectives",@"Protection of data plus XML & JSON threat protection",@"AAA : Authentication Authorization Auditing",@"Security Gateway",@"Retail Service Provider",@"DataPower & Tivoli Offerings"];
            for(int i=1;i<=13;i++)
            {
                [self.useCaseImageArray addObject:[NSString stringWithFormat:@"sg%d.png",i]];
            }

            break;
            
        }
        
        DEFAULT
        break;
    }

    
    NSLog(@"array is --> %@",self.itemArray);
    
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
    
    self.nextViewUseCaseImageString=[self.useCaseImageArray objectAtIndex:indexPath.row];
    self.nextViewUseCaseTitle=[self.itemArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"gotoHierachy3" sender:self];
    /*
    self.selectedCellText=[self.itemArray objectAtIndex:indexPath.row];
    if ([self.currentPortfolioName isEqualToString:@"integration"])
    {
        [self performSegueWithIdentifier:@"gotoHierachy4" sender:self];
    }
    else if ([self.currentPortfolioName isEqualToString:@"smarterProcess"])
    {
        [self performSegueWithIdentifier:@"gotoHierachy3" sender:self];
    }
     */
    
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    Hierachy3ViewController *hierachy3Object=[segue destinationViewController];
    hierachy3Object.scenario=self.nextViewUseCaseImageString;
    hierachy3Object.portfolioName=self.portfolioName;
    hierachy3Object.useCaseText=self.nextViewUseCaseTitle;
    hierachy3Object.selectedCapability=self.selectedCapability;
    hierachy3Object.selectedProduct=self.selectedProduct;
    NSLog(@"next view image string is %@",hierachy3Object.scenario);
    
}


@end
