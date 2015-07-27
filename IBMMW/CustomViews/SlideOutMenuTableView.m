//
//  SlideOutMenuTableView.m
//  IBMMW
//
//  Created by apple on 14/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "SlideOutMenuTableView.h"
#import "ListItem1ViewController.h"
#import "AppDelegate.h"

static int currentSelectedIndex;

@interface SlideOutMenuTableView ()

@property (nonatomic, strong) NSArray *menuContentArray;

@end

@implementation SlideOutMenuTableView {
    
}

- (void)awakeFromNib {
    
    [[NSBundle mainBundle] loadNibNamed:@"SlideOutMenuTableView" owner:self options:nil];
    [self addSubview:self.slideOutTableView];
    self.menuContentArray = [NSArray arrayWithObjects:@"What is it important", @"The Road to Smarter Processess", @"References", @"Alert", @"Miscellaneous", nil];
    
    self.slideOutTableView.delegate = self;
    self.slideOutTableView.dataSource = self;
}

+ (void)setCurrentSelectedIndex:(int)index {
    currentSelectedIndex = index;
}

+ (int)getCurrentIndex {
    return currentSelectedIndex;
}

#pragma mark -TableView DataSource Mathods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuContentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifire = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifire];
    }
    cell.textLabel.text = [self.menuContentArray objectAtIndex:indexPath.row];
    
    if ([SlideOutMenuTableView getCurrentIndex] == indexPath.row) {
        cell.backgroundColor = [UIColor grayColor];
        cell.contentView.backgroundColor = [UIColor grayColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    else {
        cell.backgroundColor = [UIColor whiteColor];
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    
    return cell;
}

#pragma mark -TableView Delegate Method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [[NSNotificationCenter defaultCenter] postNotificationName:@"SlideOutMenuClicked" object:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == [SlideOutMenuTableView getCurrentIndex]) {
        return;
    }
    [SlideOutMenuTableView setCurrentSelectedIndex:indexPath.row];
    AppDelegate *delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    delegate.contentText=[self.menuContentArray objectAtIndex:indexPath.row];
    ListItem1ViewController *listItem1VC = [self.parantViewController.storyboard instantiateViewControllerWithIdentifier:@"listItem1VC"];
    [self.parantViewController.navigationController pushViewController:listItem1VC animated:NO];

}

@end
