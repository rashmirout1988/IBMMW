//
//  ListItem1CollectionViewCell.h
//  IBMMW
//
//  Created by apple on 15/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListItem1CollectionViewCell : UICollectionViewCell
@property (nonatomic,weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet UIImageView *slideImageView;
@property (nonatomic, weak) IBOutlet UIImageView *rightArrowImage;
@property (nonatomic, weak) IBOutlet UIImageView *leftArrowImage;

@end
