//
//  ListItem1ViewController.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/15/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "ListItem1ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "FooterTableView.h"
#import "SlideOutMenuTableView.h"
#import "ItemNavigation1.h"
#import "ListItem1CollectionViewCell.h"
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

@interface ListItem1ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet HeaderView *headerView;
@property (nonatomic, weak) IBOutlet FooterView *footerView;
@property (nonatomic, weak) IBOutlet SlideOutMenuTableView *slideOutMenuTableView;
@property (nonatomic, weak) IBOutlet ItemNavigation1 *itemNavigationView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *slideOutTableViewWidthConstraints;
@property (nonatomic, weak) IBOutlet UICollectionView *slideCollectionView;
@property (nonatomic, weak) IBOutlet  FooterTableView *footerTableView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *footerTableViewHeightConstraint;

@property (nonatomic, strong) NSMutableArray *imagesArray;
@property (nonatomic, strong) NSMutableArray *headingTextArray;
@end

@implementation ListItem1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.headerView.currentViewController = self;
    self.headerView.menuTableView = self.slideOutMenuTableView;
    self.headerView.menuTableViewWidthConstraints = self.slideOutTableViewWidthConstraints;
    self.headerView.contentView.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
    [self.itemNavigationView setHierarchyNavigationBarForLevel:HierarchyLevel1];
    [self.itemNavigationView.navigationButton2 setTitle:delegate.contentText forState:UIControlStateNormal];
    self.itemNavigationView.parantViewController = self;
    self.slideOutMenuTableView.parantViewController = self;
    self.footerView.currentViewController = self;
    self.footerView.footerTableView = self.footerTableView;
    self.footerView.footerTableViewHeightConstraints = self.footerTableViewHeightConstraint;
    self.footerTableView.parentViewController = self;

    self.imagesArray = [NSMutableArray array];
    self.headingTextArray =[NSMutableArray array];
    
    NSLog(@"the passed object is %@",delegate.contentText);
    NSString *imageNameText;
    int imagecount=0;
    if([delegate.contentText isEqualToString:@"What is it important"])
     {
         imageNameText=@"slide";
         imagecount=14;
        [self.headingTextArray addObjectsFromArray: @[@"IBM Smarter Process is…",@"Business processes and decisions are the heart of your business",@"What are the problems with a typical business process?",
                                                       @"Smarter Process brings Simplicity,Visibility and Control",@"A process-driven business requires productive execution",
                                                       @"First,you must capture your business process",@"A process-driven business requires productive execution",
                                                       @"IBM Business Process Manager makes it easy",@"IBM BPM provides a single location to develop and execute business processes",
                                                       @"Better understand your business through process monitoring,Process monitoring with IBM Business Process Manager",
                                                       @"Agility enables continual process improvement",@"Simulating “What If” changes can help answer these  questions",
                                                       @"Business rules and events can make your business processes smarter",@"Next steps"]];
         
         NSLog(@"the count is %lu",(unsigned long)self.headingTextArray.count);
     }
    else if ([delegate.contentText isEqualToString:@"The Road to Smarter Processess"])
    {
        
        imageNameText=@"rm";
        imagecount=4;
        [self.headingTextArray addObjectsFromArray: @[@"Smarter Process – Selling Card",@"Selling model = Adoption Model",@"Select strategic investments in 2015 and beyond",@"What do the Analysts Say?"]];

        NSLog(@"the count is %lu",(unsigned long)self.headingTextArray.count);
        
    }
    else if ([delegate.contentText isEqualToString:@"References"])
    {
        imageNameText=@"References";
        imagecount=16;
        [self.headingTextArray addObjectsFromArray: @[@"A bank in the Middle East- approves loans in 30 minutes",@"A credit agency – rolls out customized solutions with IBM Operational Decision Manager",@"A global bank- delivering a best-in-class tax offering for global investors",@"US-based healthcare company – Gets ahead of growing claims volume",@"An insurance company – Automates its change request process for financial reference data with an IBM solution",
                                                      @"Banco de Fomento Angola – Faster Banco de Fomento Angola processes support 11 percent customer growth",
                                                      @"Control Risks Group – Building more robust processes and better data governance with a suite of IBM software",
                                                      @"CST Consulting S.r.l. – Uses IBM MobileFirst Platform Foundation to streamline mobile app development",
                                                      @"CTTI – Enabling first-class, joined-up care by multiple healthcare organisations across Catalonia",
                                                      @"KeyBank – Eliminates geographical boundaries, improves efficiency",
                                                      @"KPMG – Cutting time-to-market for new business processes by 90 percent",
                                                      @"Large European bank sees more than 28 million euro savings in BPM costs",
                                                      @"A vehicle manufacturer- helps speed new business rules to market with IBM Operational Decision Manager",
                                                      @"Banorte teams with IBM for a major shift to a client-centric strategy",
                                                      @"Cambridgeshire Fire & Rescue Service- driving efficient collaboration with IBM Business Process Management",
                                                      @"A bank in the Middle East- approves loans in 30 minutes"]];
        NSLog(@"the count is %d",self.headingTextArray.count);
    }
    else if ([delegate.contentText isEqualToString:@"Miscellaneous"])
    {
        imageNameText=@"Msc";
        imagecount=21;
        [self.headingTextArray addObjectsFromArray: @[@"To reach new markets Smarter Process must be viewed as an enabler",@"Digital Transformation is realized through CAMSS",
                                                      @"Key Process Imperatives",@"Key Process Imperatives",@"Data has to be seen as a competitive advantage",
                                                      @"Smarter Process acts in context with data",@"Leverage data for action and context",
                                                      @"Smarter Process provides the agility, consistency and context to turn data into action",
                                                      @"Key Process Imperatives",@"Cloud has become a way to transform your business",
                                                      @"Smarter Process injects cloud capabilities into your organization",
                                                      @"Smarter Process drives simplicity and speed through the cloud",
                                                      @"IBM BPM on Cloud",@"Key Process Imperatives",@"Engagement is changing interactions and how work gets done",
                                                      @"Engagement is about creating a mobile moment",@"Smarter Process accelerates customer engagement",
                                                      @"Business-led Change to Processes and Decisions",@"Key Process Imperatives",
                                                      @"Data has life – Connecting Things,People andprocesses achieving higher customer centricity",
                                                      @"Logistics example - Powered by ODM Advanced along with Business Process ManagerWhy is it important"]];
        
        NSLog(@"the count is %d",self.headingTextArray.count);

        
    }
    
    for (int i = 1; i <=imagecount; i++)
    {
        [self.imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@""%d.png",imageNameText,i]]];
    }

    NSMutableArray *navigationStackArray = [self.navigationController.viewControllers mutableCopy];
    NSLog(@"%@",navigationStackArray);
    if (navigationStackArray.count > 3) {
        NSRange range;
        range.location = 2;
        range.length = navigationStackArray.count - 3;
        [navigationStackArray removeObjectsInRange:range];
        NSLog(@"%@",navigationStackArray);
    }
    self.navigationController.viewControllers = navigationStackArray;

    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self checkOrientation];
    [super viewWillAppear:YES];
    
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
        [self changeOrientationLandscape_iPad];
    }
    else
    {
        [self changeOrientationPortrait_iPad];
    }
}
-(void)changeOrientationPortrait_iPad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_portrait.png"]];
}

-(void)changeOrientationLandscape_iPad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background01.png"]];
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
    [self.slideCollectionView.collectionViewLayout invalidateLayout];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    //    NSLog(@"Pinch scale: %f", recognizer.scale);
    if (recognizer.scale >1.0f && recognizer.scale < 2.5f) {
        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
        ((ListItem1CollectionViewCell *)recognizer.view).transform =transform;

    }
    
    
}


#pragma mark - UICollectionView DataSource Mathods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire = @"cell";
    ListItem1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
       cell.textLabel.text=[self.headingTextArray objectAtIndex:indexPath.row];
        cell.slideImageView.image = [self.imagesArray objectAtIndex:indexPath.row];
    UIPinchGestureRecognizer *gestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(twoFingerPinch:)];
    [cell addGestureRecognizer:gestureRecognizer];

    
    if(indexPath.row==self.imagesArray.count-1)
    {
        cell.rightArrowImage.alpha=0;
        cell.leftArrowImage.alpha=1;
    }
    else{
        
        cell.rightArrowImage.alpha=1;
        cell.leftArrowImage.alpha=0;

    }
    

    
//    twoFingerPinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector([[twoFingerPinch:withimage:cell.slideImageView]];
//                                                                                         
    
       // [self performSelector:@selector(imageAnimationWithImage:andDurationArray:) withObject:imgarray withObject:durationArr afterDelay:[[durationArr objectAtIndex:count] doubleValue]];

      return cell;
}
/*
- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    //    NSLog(@"Pinch scale: %f", recognizer.scale);
    if (recognizer.scale >1.0f && recognizer.scale < 2.5f) {
        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
        _useCaseImage.transform = transform;
    }
}
 */

#pragma mark - UICollectionView Delegate Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.slideCollectionView.frame.size;
}

@end
