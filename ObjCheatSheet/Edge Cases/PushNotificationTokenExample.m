//
//  PushNotificationTokenExample.m
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//


/*THE REASON
 below iOS 13 we recived a token that looked something like this:
 <124686a5 556a72ca d808f572 00c323b9 3eff9285 92445590 3225757d b83967be>

 and since iOS 13 we recvied a token that looked something like this:
 {length = 32, bytes = 0xd3d997af 967d1f43 b405374a 13394d2f ... 28f10282 14af515f }

 so we need to parse it differently
 */





//appDelegate Quick Loock :
/*
 
 - (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
     NSLog(@"deviceToken = %@", devToken);
     someClass *nameOfTheClass = [someClass new];
     [nameOfTheClass setToken:devToken];
     

 }
 
 */
#import <Foundation/Foundation.h>

@interface PushNotificationTokeExample : NSObject
@end

@implementation PushNotificationTokeExample

-(void)parseTokenCurrectly {
    
    // Dummy Data example of our token that we get from the push notification service in appDelegate
    // see appDelegate Quick Look above for real use case.. but basically. hold in this class a var for the toke and pass it.
    NSString *test = @"testing";
    NSData* tokenData = [test dataUsingEncoding:NSUTF8StringEncoding];
    
    
    
    
    //the old way to parse this data. works fine if the targeted SDK is below 13.
    //but its still recomended to use the other way.

    //1)
    
    //    NSString *deviceTokenStr = [[[tokenData description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];

    
    // 2)
    // the 13 SDK way of parsing the token
        NSUInteger length = tokenData.length;
        if (length == 0) {
            return;
        }
        const unsigned char *buffer = tokenData.bytes;
        NSMutableString *hexString  = [NSMutableString stringWithCapacity:(length * 2)];
        for (int i = 0; i < length; ++i) {
            [hexString appendFormat:@"%02x", buffer[i]];
        }
}


@end
