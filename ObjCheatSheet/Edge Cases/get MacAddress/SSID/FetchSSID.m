//
//  FetchSSID.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "FetchSSID.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>


@implementation FetchSSID

/* getting wifi information
    since ios 12 there is a problem with this CNCopySupportedInterfaces,
    To use this function in iOS 12 and later, enable the Access WiFi Information capability for your app in Xcode. When you enable this capability, Xcode automatically adds the Access WiFi Information entitlement to your entitlements file and App ID.
 
    In iOS 13 you need to add to that and get the user promission for location services or you will get nil.
 
 */
+ (NSDictionary *)fetchSSIDInfo {
    NSArray *interfaceNames = CFBridgingRelease(CNCopySupportedInterfaces());
    NSLog(@"%s: Supported interfaces: %@", __func__, interfaceNames);

    NSDictionary *SSIDInfo;
    for (NSString *interfaceName in interfaceNames) {
        SSIDInfo = CFBridgingRelease(
            CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName));
        NSLog(@"%s: %@ => %@", __func__, interfaceName, SSIDInfo);

        BOOL isNotEmpty = (SSIDInfo.count > 0);
        if (isNotEmpty) {
            break;
        }
    }
    return SSIDInfo;
}

+ (void)getMacAddress: (void (^)(NSString *macAddress, BOOL showAlert))completionBlock {
// check the iOS version: if 12 get the bssid (we dont need location permission) and return NO Bool,
//    so it dosent ask the user for location permission.
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 13.0) {
            //TODO: return bssid
            NSString *macAddress = [self fetchSSIDInfo][@"BSSID"] ?: @"";
            NSNumber *boolean = [NSNumber numberWithBool:NO];
                completionBlock(macAddress,NO);
        }
    
//    check the iOS version: if 13, return YES Bool and ask the user for location permission.
//    only then get the bssid.
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0) {
            //send to check location permission before getting bssid
            NSNumber *boolean = [NSNumber numberWithBool:YES];
            completionBlock(nil,boolean);

    }
   
}

@end
