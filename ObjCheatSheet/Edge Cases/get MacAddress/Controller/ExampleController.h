//
//  ExampleController.h
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleController : UIViewController
@property (nonatomic, strong) CLLocationManager *myLocationManager;

@end

NS_ASSUME_NONNULL_END
