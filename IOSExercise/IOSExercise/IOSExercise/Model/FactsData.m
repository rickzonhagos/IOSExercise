//
//  FactsData.m
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "FactsData.h"
#import "Facts.h"
#import "FactsItem.h"
@interface FactsData(){
    
}
@property(nonatomic, strong) Facts *currenctFacts;
@end;

@implementation FactsData

-(int) getNumberOfFactsItem{
    int count = 0;
    if(self.currenctFacts){
        count = [[self.currenctFacts factsItem] count];
    }
    return count;
}
-(Facts *) getFacts{
    if(self.currenctFacts){
        return self.currenctFacts;
    }
    return nil;
}
-(id) initWithJSONData : (NSDictionary *) jsonData{
    
    Facts *facts = [Facts new];
    
    facts.title = [jsonData objectForKey:@"title"];
    
    __block NSMutableArray *factItem = [NSMutableArray new];
    [[jsonData objectForKey:@"rows"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
     
        FactsItem *items = [FactsItem new];
        items.title = [obj objectForKey:@"title"];
        items.description = [obj objectForKey:@"description"];
        items.imageHref = [obj objectForKey:@"imageHref"];
        [factItem addObject:items];
        
    }];
    
    facts.factsItem = [factItem copy];
    
    self.currenctFacts = facts;
    return self;
}
@end
