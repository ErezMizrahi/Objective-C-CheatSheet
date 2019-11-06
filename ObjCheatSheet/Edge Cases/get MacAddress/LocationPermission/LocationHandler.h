//
//  LocationHandler.h
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationHandler : NSObject
-(void)handleAuthLocationStatus: (void (^)(NSString *macAddress))completionBlock;
@end

NS_ASSUME_NONNULL_END
