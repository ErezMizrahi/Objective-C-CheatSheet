//
//  FetchSSID.h
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FetchSSID : NSObject

+ (NSDictionary *)fetchSSIDInfo;
+ (void)getMacAddress: (void (^)(NSString *macAddress, BOOL showAlert))completionBlock;
@end

NS_ASSUME_NONNULL_END
