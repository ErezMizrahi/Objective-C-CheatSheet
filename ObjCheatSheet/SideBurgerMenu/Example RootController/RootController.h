//
//  RootController.h
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 06/11/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideInTransition.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootController : UIViewController<UIViewControllerTransitioningDelegate>
@property(nonatomic,strong)SlideInTransition *slidein;

@end

NS_ASSUME_NONNULL_END
