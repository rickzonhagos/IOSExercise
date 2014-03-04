//
//  UINavigationController+RotationIn_IOS6.m
//  IOSExercise
//
//  Created by rickzon hagos on 4/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "UINavigationController+RotationIn_IOS6.h"

@implementation UINavigationController (RotationIn_IOS6)
-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject]  preferredInterfaceOrientationForPresentation];
}
@end
