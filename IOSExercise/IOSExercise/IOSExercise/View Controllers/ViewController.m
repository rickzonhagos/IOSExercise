//
//  ViewController.m
//  IOSExercise
//
//  Created by rickzon hagos on 3/3/14.
//  Copyright (c) 2014 rickzon hagos. All rights reserved.
//

#import "ViewController.h"
#import "DataRequest.h"
#import "FactsData.h"
#import "Facts.h"
#import "CustomUIElements.h"
#import "FactsItem.h"
#import "HTTPRequest.h"
#define kRowHeight  50.0f


@interface ViewController (){
    CGFloat labelWidth;
    UIActivityIndicatorView *myIndicator;
}
@property(nonatomic, strong) NSArray *factsItem;
@property(nonatomic , strong) IBOutlet UITableView *myTableView;
@end

@implementation ViewController
@synthesize factsItem = _factsItem;
@synthesize myTableView = _myTableView;
#pragma mark -
#pragma mark - view life cycle
#pragma mark - 

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self initDataRequest];
}
- (void)viewDidLoad
{
    // Do any additional setup after loading the view, typically from a nib.
   
    [super viewDidLoad];
    
    [self initIndicatorView];
	
    self.title = @"Facts";
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [_myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark - Init method
#pragma mark -
-(void) initIndicatorView{
    
    myIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    myIndicator.frame = self.view.frame;
    myIndicator.hidesWhenStopped = YES;
    [myIndicator setBackgroundColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:.5]];
    [self.view addSubview:myIndicator];
    [myIndicator startAnimating];
}
-(void) stopIndicator{
    [myIndicator stopAnimating];
}
#pragma mark -
#pragma mark - Data Request
#pragma mark -

-(void) initDataRequest{
    DataRequest *dataRequest = [DataRequest sharedDataRequest];
    [dataRequest getJSONDataFor:self withSelector:@selector(receivedJSONData:) withReturnType:[FactsData class]];
}
-(void) receivedJSONData : (id) data{
    if([data isKindOfClass:[NSError class]]){
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Something went wrong on your internet connection." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [view show];
    }
    if([data isKindOfClass:[FactsData class]]){
        Facts *myData = (Facts *) [data getFacts];
       
        
        //set Facts Item
        self.factsItem = [myData factsItem];
        
        //reload table
        [_myTableView reloadData];
       
    }
   
    //stop indicator
    if([myIndicator isAnimating]){
        [self performSelector:@selector(stopIndicator) withObject:nil afterDelay:.1];
    }
}
#pragma mark -
#pragma mark - TableView Delegate
#pragma mark -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int count = 0;
    if(self.factsItem){
        count = [_factsItem count];
    }
    return count;
}
-(UITableViewCell *) getCustomCellWithTableView:(UITableView *) tableView withCellIdentifier :(NSString *) cellIdentifier{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UILabel *label = nil;
    CGRect frame = CGRectZero;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    UIFont *boldFont = [UIFont boldSystemFontOfSize:16.0f];
    UIFont *normalFont = [UIFont systemFontOfSize:15.0f];
    UIImageView *imageView = nil;
    
    //image view
    h = kRowHeight;
    w = 80;
    frame = CGRectMake(x, y, w, h);
    imageView = [CustomUIElements createImageViewWithFrame:frame];
    imageView.tag = 1000;
    //[imageView setBackgroundColor:[UIColor blackColor]];
    [cell.contentView addSubview:imageView];
    imageView = nil;
    
    UIActivityIndicatorView *indicator = nil;
    frame = CGRectMake(x, y, w, h);
    indicator = [CustomUIElements createActivityIndicatorWithFrame:frame];
    indicator.tag = 8888;
    [cell.contentView addSubview:indicator];
    indicator = nil;
    
    //title
    x += w;
    h /= 2;
    w = 220.0f;
    frame = CGRectMake(x, y, w, h);
    label = [CustomUIElements createLabelWithFrame:frame withTitle:@"" withTextColor:[UIColor blackColor] withTextAlignment:NSTextAlignmentLeft withFont:boldFont withBGColor:[UIColor clearColor]];
    label.tag = 2000;
    [label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [cell.contentView addSubview:label];
    label = nil;
    
    y += h;
    //description
    frame = CGRectMake(x, y, w, h);
    label = [CustomUIElements createLabelWithFrame:frame withTitle:@"" withTextColor:[UIColor blackColor] withTextAlignment:NSTextAlignmentLeft withFont:normalFont withBGColor:[UIColor clearColor]];
    label.tag = 3000;
    [label setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [cell.contentView addSubview:label];
    label = nil;
    
    
    
    return cell;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [self getCustomCellWithTableView:tableView withCellIdentifier:CellIdentifier];
    }
   
    UILabel *label = nil;
    UIImageView *imageView = nil;
    UIActivityIndicatorView *indicator = nil;
    
    
    FactsItem *item = (FactsItem *)[_factsItem objectAtIndex:indexPath.row];
    
    imageView = (UIImageView *)[cell viewWithTag:1000];
    indicator = (UIActivityIndicatorView *) [cell viewWithTag:8888];
    
    
    if(item.image == nil){
        if(!_myTableView.isDragging && !_myTableView.isDecelerating){
            [self getImageWithURL:item.imageHref withIndexPath:indexPath withImageView:imageView withIndicator:indicator];
        }
    }else{
        [imageView setImage:item.image];
    }
    
    imageView = nil;
    indicator = nil;
    
    //title
    label = (UILabel *) [cell viewWithTag:2000];
    [label setText:item.title];
    label = nil;
    
    //description
    label = (UILabel *) [cell viewWithTag:3000];
    if(![item.description isKindOfClass:[NSNull class]]){
        [label setText:item.description];
    }
    label = nil;
    
    return cell;
}

#pragma mark -
#pragma mark - Image Downloader
#pragma mark -
-(void) getImageWithURL:(NSString *) url withIndexPath : (NSIndexPath *) indexPath withImageView:(UIImageView *) imageView withIndicator : (UIActivityIndicatorView *) indicator{
    

    if(![url isKindOfClass:[NSNull class]]){
        NSURL *imgURL = [NSURL URLWithString:url];
        HTTPRequest *request = [[HTTPRequest alloc] initRequestWithURL:imgURL withCompletionHandler:^(UIImage *image) {
            if(image != nil){
                FactsItem *item = (FactsItem *)[_factsItem objectAtIndex:indexPath.row];
                item.image = image;
                [imageView setImage:image];
                
            }else{
                [imageView setImage:[UIImage imageNamed:@"placeholder1.jpg"]];
            }
            
            imageView.hidden = NO;
            if([indicator isAnimating]){
                [indicator stopAnimating];
            }
            indicator.hidden = YES;
            
        }];
    }
}
#pragma mark -
#pragma mark - Orientation
#pragma mark - 
-(BOOL)shouldAutorotate
{
    [_myTableView reloadData];
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  
	return YES;
}

@end
