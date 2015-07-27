//
//  FooterTableView.m
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/22/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "FooterTableView.h"
#import "HomeViewController.h"
@interface FooterTableView ()

@property (nonatomic, strong) NSArray *contentArray;

@end

@implementation FooterTableView
- (void)awakeFromNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"FooterTableView" owner:self options:nil];
    [self addSubview:self.footerTableView];
    self.contentArray = [NSArray arrayWithObjects:@"Application Platform", @"Integration", @"Smarter Process", @"Digital Experience", @"IT Service Management", nil];
    
    self.footerTableView.delegate = self;
    self.footerTableView.dataSource = self;
   // self.footerTableView.separatorColor=[UIColor blackColor];
}
#pragma mark -TableView DataSource Mathods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifire];
    }
    
    cell.backgroundColor=[UIColor colorWithRed:253.0/255.0 green:185.0/255.0 blue:18.0/255.0 alpha:1.0];
    cell.textLabel.text = [self.contentArray objectAtIndex:indexPath.row];
    
    
    return cell;
}

#pragma mark -TableView Delegate Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];

    if([selectedCell.textLabel.text isEqualToString:@"Smarter Process"])
    {
        [self.parentViewController.navigationController popToViewController:[self.parentViewController.navigationController.viewControllers objectAtIndex:1] animated:NO];
        
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [alert show];

    }
    
    
 //
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
