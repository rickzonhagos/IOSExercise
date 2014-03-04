//
//  DataRequest.h
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HTTPRequest;
@interface DataRequest : NSObject{
    
}


+(id) sharedDataRequest;

-(void) getJSONDataFor:(id) _target withSelector: (SEL) _selector withReturnType : (Class) returnType;

@end
