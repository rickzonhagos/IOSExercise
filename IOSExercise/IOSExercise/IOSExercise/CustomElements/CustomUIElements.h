//
//  CustomUIElements.h
//  IOSExercise
//
//  Created by rickzon hagos on 4/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomUIElements : NSObject


+(UILabel *) createLabelWithFrame : (CGRect) myFrame withTitle :(NSString *) title withTextColor :(UIColor *)textColor withTextAlignment :(NSTextAlignment) textAlignment withFont : (UIFont *) font withBGColor :(UIColor *) bgColor;

+(UIImageView *) createImageViewWithFrame : (CGRect) frame;

+(UIActivityIndicatorView *) createActivityIndicatorWithFrame : (CGRect) frame;
@end
