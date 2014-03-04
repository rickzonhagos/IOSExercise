//
//  FactsItem.h
//  IOSExercise
//
//  Created by rickzon hagos on 4/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactsItem : NSObject{
    NSString *title;
    NSString *description;
    NSString *imageHref;
    UIImage *image;
}
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *description;
@property(nonatomic, copy) NSString *imageHref;
@property(nonatomic, copy) UIImage *image;
@end
