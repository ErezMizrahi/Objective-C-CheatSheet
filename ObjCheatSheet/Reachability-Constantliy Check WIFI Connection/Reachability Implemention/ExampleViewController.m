//
//  ExampleViewController.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "ExampleViewController.h"
//1
#import "Reachability.h"

@interface ExampleViewController ()
//2
@property (nonatomic, strong) Reachability* reachability;
@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //3
    [self setReachabilityNotification];
}

-(void)setReachabilityNotification {
    _reachability = [Reachability reachabilityForInternetConnection];
    
    //set notification observer to watch when the internet connection changed.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityDidChanged:) name:kReachabilityChangedNotification object:_reachability];
    
    //start
    [_reachability startNotifier];
}

-(void)reachabilityDidChanged: (NSNotification*)note {
    // check if we've got network connectivity
    Reachability *notifier = [note object];
    NetworkStatus myStatus = [notifier currentReachabilityStatus];
    
    switch (myStatus) {
        case NotReachable:
            NSLog(@"There's no internet connection at all. Display error message now.");
            break;
            
        case ReachableViaWWAN:
            NSLog(@"Only WAN Internet Connection. Display error message now.");
            break;
            
        case ReachableViaWiFi:
           NSLog(@"Only WIFI Internet Connection. Display error message now.");
            break;
            
        default:
            break;
    }
}

//remove the observer when the class is deallocated
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_reachability stopNotifier];
}

@end
