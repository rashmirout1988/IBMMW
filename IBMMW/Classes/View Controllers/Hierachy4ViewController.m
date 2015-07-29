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
@end

@implementation Hierachy4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel3];
    [self.itemNavigationView setHierarchyNavigationBarItemImageForPortfolio:self.portfolioName];

    self.itemNavigationView.parantViewController = self;
    self.slideOutMenuTableView.parantViewController = self;
    self.itemArray=@[@"1",@"2",@"3",@"4"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire = @"Cell";
    
    HierachyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
    cell.itemNameLabel.text = [self.itemArray objectAtIndex:indexPath.row];
    cell.bgImageView.image=[UIImage imageNamed:@"productbutton.png"];
     
    return cell;
}

#pragma mark - UICollectionView Delegate Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize cellSize = CGSizeMake(self.itemCollectionView.frame.size.width/2 - 20.0f, 46.0f);
    
    return cellSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
