//
//  HTTPRequest.m
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "HTTPRequest.h"
@interface HTTPRequest(){
    
}
@property(nonatomic, strong) NSURLRequest *myRequest;
@property(nonatomic, strong) NSURLConnection *myConnection;
@property(nonatomic, strong) NSURL *myURL;
@property(nonatomic, strong) NSMutableData *receivedData;
@property(nonatomic, strong) id myReturnType;
@property(nonatomic, strong) id myTarget;
@property(nonatomic, assign) SEL mySelector;

@end;

@implementation HTTPRequest
@synthesize myRequest = _myRequest;
@synthesize myConnection = _myConnection;
@synthesize myURL = _myURL;
@synthesize receivedData = _receivedData;
@synthesize completionHandler = _completionHandler;
#pragma mark -
#pragma mark -  init methods
#pragma mark -
-(id) initRequestWithURL:(NSURL *) url withTarget:(id) target withSelector: (SEL) selector withReturnData: (id) returnType{
    self = [super init];
    if(self){
        self.myURL = url;
        self.myRequest = [NSURLRequest requestWithURL:self.myURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        self.myConnection = [[NSURLConnection alloc] initWithRequest:self.myRequest delegate:self];
        self.myReturnType = returnType;
        self.myTarget = target;
        self.mySelector = selector;
        self.receivedData = [NSMutableData new];
        
    }
    return self;
}
-(id) initRequestWithURL :(NSURL *) url withCompletionHandler : (void(^)(UIImage *image) ) completionHandler{
    self = [super init];
    if(self){
        self.myURL = url;
        self.myRequest = [NSURLRequest requestWithURL:self.myURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        self.myConnection = [[NSURLConnection alloc] initWithRequest:self.myRequest delegate:self];
        self.completionHandler = completionHandler;
        self.receivedData = [NSMutableData new];
        
    }
    return self;
}
#pragma mark -
#pragma mark - NSURLConnection Delegate
#pragma mark -

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
}
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
   
    NSLog(@"Error %@",error);
    
    self.myURL = nil;
    self.myRequest = nil;
    self.myConnection = nil;
    self.completionHandler = nil;
    self.receivedData = nil;
    
    self.myReturnType = nil;
    self.myTarget = nil;
    self.mySelector = nil;
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    id data = nil;
    NSError *error = nil;
    if(self.myReturnType){
        if([self.myReturnType respondsToSelector:@selector(initWithJSONData:)])
        {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:_receivedData options:kNilOptions error:&error];
            
            data = [self.myReturnType performSelector:@selector(initWithJSONData:) withObject:dict];
            
            if([self.myTarget respondsToSelector:self.mySelector]){
                [_myTarget performSelector:_mySelector withObject:data];
            }
        }
    }
    
    
    if(self.completionHandler){
        UIImage *image = [[UIImage alloc] initWithData:_receivedData];
        self.completionHandler(image);
    }
}

@end
