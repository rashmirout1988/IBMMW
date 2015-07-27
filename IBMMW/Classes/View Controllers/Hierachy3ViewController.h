//
//  Hierachy3ViewController.h
//  IBMMW
//
//  Created by Rashmi Ranjan on 7/14/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Hierachy3ViewController : UIViewController
{
     UIPinchGestureRecognizer *twoFingerPinch;
}
@property (weak, nonatomic) IBOutlet UIImageView *useCaseImage;
@property (nonatomic,strong)  NSString *scenario;
@property (nonatomic,strong)  NSString *productName;
@end
