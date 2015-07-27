//
//  PushNoAnimationSegue.m
//  IBMMW
//
//  Created by apple on 15/07/15.
//  Copyright (c) 2015 Rashmi Ranjan. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

-(void) perform{
    
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
