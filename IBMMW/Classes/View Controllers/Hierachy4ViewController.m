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
#import "ItemNavigation1.h"
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

@end

@implementation Hierachy4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel4];
    self.itemNavigationView.parantViewController = self;
    
    self.slideOutMenuTableView.parantViewController = self;
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
