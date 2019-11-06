//
//  LocationHandler.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "LocationHandler.h"
#import "FetchSSID.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationHandler

-(void)handleAuthLocationStatus: (void (^)(NSString *macAddress))completionBlock  {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    switch (status) {
            
        case kCLAuthorizationStatusDenied: {
            NSLog(@"kCLAuthorizationStatusDenied");
            completionBlock(@"00:00:00:00:00:00");
            break;
        }
        case kCLAuthorizationStatusRestricted: {
            NSLog(@"kCLAuthorizationStatusRestricted");
            break;
        }
        case kCLAuthorizationStatusNotDetermined: {
            NSLog(@"kCLAuthorizationStatusNotDetermined");
            break;
        }
        case kCLAuthorizationStatusAuthorizedAlways: {
            NSLog(@"kCLAuthorizationStatusAuthorizedAlways");
            [FetchSSID getMacAddress:^(NSString * _Nonnull macAddress, BOOL   showAlert) {
                completionBlock(macAddress);
            }];
            break;
        }
        case kCLAuthorizationStatusAuthorizedWhenInUse: {
            NSLog(@"kCLAuthorizationStatusAuthorizedWhenInUse");
            NSString* macAddress = [FetchSSID fetchSSIDInfo][@"BSSID"];
            completionBlock(macAddress);
            break;
        }
    }
}
@end
