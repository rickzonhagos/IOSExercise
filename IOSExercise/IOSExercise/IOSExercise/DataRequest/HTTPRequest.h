//
//  HTTPRequest.h
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequest : NSObject<NSURLConnectionDelegate>{
    
}
@property(nonatomic, copy) void (^completionHandler) (UIImage *image);
-(id) initRequestWithURL:(NSURL *) url withTarget:(id) target withSelector: (SEL) selector withReturnData: (id) returnType;

-(id) initRequestWithURL :(NSURL *) url withCompletionHandler : (void(^)(UIImage *image) ) completionHandler;
@end
