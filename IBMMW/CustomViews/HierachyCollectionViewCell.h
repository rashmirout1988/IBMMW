//
//  HierachyCollectionViewCell.h
//  IBMMW
//
//  Created by apple on 21/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HierachyCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *bgImageView;
@property (nonatomic, weak) IBOutlet UIImageView *rightArrowImage;
@property (nonatomic, weak) IBOutlet UIImageView *leftArrowImage;
@property (nonatomic, weak) IBOutlet UILabel *itemNameLabel;

@end
