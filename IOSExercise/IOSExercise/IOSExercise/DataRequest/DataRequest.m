//
//  DataRequest.m
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "DataRequest.h"
#import "HTTPRequest.h"

@implementation DataRequest

+(id) sharedDataRequest{
    static DataRequest *sharedDataRequest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataRequest =  [DataRequest new];
    });
    return sharedDataRequest;
}

-(id) init{
    self = [super init];
    if(self){
    
    }
    return self;
}
#pragma mark -
#pragma mark - Get JSON  methods
#pragma mark -

-(void) getJSONDataFor:(id) _target withSelector: (SEL) _selector withReturnType : (Class) returnType{
    
    id dataObject = [[returnType alloc] init];
    
    NSURL *myURL = [NSURL URLWithString:@"http://guarded-basin-2383.herokuapp.com/facts.json"];
    HTTPRequest *httpRequest = [[HTTPRequest alloc] initRequestWithURL:myURL withTarget:_target withSelector:_selector withReturnData:dataObject];
    
}


@end
