//
//  ExampleController.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "ExampleController.h"
#import "FetchSSID.h"
#import "LocationHandler.h"


@implementation ExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkForMacAddressProccess:^(NSString *blockURL) {
        NSLog(@"Mac Address: %@", blockURL);
    }];
}

-(void) checkForMacAddressProccess:(void (^)(NSString *blockURL))completionBlock {
[FetchSSID getMacAddress:^(NSString * _Nonnull macAddress, BOOL  showAlert) {
    //show alert because this is ios 13 or above
    if (showAlert) {
        [self->_myLocationManager requestWhenInUseAuthorization];
        [[LocationHandler new]handleAuthLocationStatus:^(NSString * _Nonnull macAddress) {
            if ([macAddress isEqualToString:@""]){
                completionBlock(@"00:00:00:00:00:00");
                NSLog(@"even if url is empty and it shouldnot happen.. return 00000000");
            }else{
                //we get here if the os is 13 +
                completionBlock(macAddress);

            }
        }];
    }else{
        // we get here if the os is lower the 13
        completionBlock(macAddress);
    }
}];

}

@end
