//
//  Facts.h
//  IOSExercise
//
//  Created by rickzon hagos on 4/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FactsItem;
@interface Facts : NSObject{
    NSString *title;
    NSArray *factsItem;
}
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) NSArray *factsItem;
@end
