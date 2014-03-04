//
//  FactsData.h
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Facts;
@interface FactsData : NSObject

-(id) initWithJSONData : (NSDictionary *) jsonData;
-(int) getNumberOfFactsItem;
-(Facts *) getFacts;
@end
