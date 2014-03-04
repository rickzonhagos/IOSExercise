//
//  CustomUIElements.m
//  IOSExercise
//
//  Created by rickzon hagos on 4/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "CustomUIElements.h"

@implementation CustomUIElements


+(UILabel *) createLabelWithFrame : (CGRect) myFrame withTitle :(NSString *) title withTextColor :(UIColor *)textColor withTextAlignment :(NSTextAlignment) textAlignment withFont : (UIFont *) font withBGColor :(UIColor *) bgColor{
    
    UILabel *label = [[UILabel alloc] initWithFrame:myFrame];
    [label setText:title];
    [label setTextColor:textColor];
    [label setTextAlignment:textAlignment];
    [label setFont:font];
    [label setBackgroundColor:bgColor];
    return label;
}
+(UIImageView *) createImageViewWithFrame : (CGRect) frame{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    return imageView;
}
+(UIActivityIndicatorView *) createActivityIndicatorWithFrame : (CGRect) frame {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray ];
    indicator.frame = frame;
    [indicator startAnimating];
    
    return indicator;
}
@end
