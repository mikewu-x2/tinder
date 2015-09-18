//
//  fadeSegue.m
//  tinder
//
//  Created by Michael Wu on 9/18/15.
//  Copyright © 2015 Michael Wu. All rights reserved.
//

#import "fadeSegue.h"

@implementation fadeSegue

- (void)perform
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionFade;
    
    [[[[[self sourceViewController] view] window] layer] addAnimation:transition
                                                               forKey:kCATransitionFade];
    
    [[self sourceViewController]
     presentViewController:[self destinationViewController]
     animated:NO completion:NULL];
}

@end