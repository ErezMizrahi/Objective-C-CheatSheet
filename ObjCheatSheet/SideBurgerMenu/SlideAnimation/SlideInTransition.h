//
//  SlideInTransition.h
//  SlideInMenuOBJC
//
//  Created by Erez Mizrahi on 28/10/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideInTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic) BOOL isMenuOpen;
@property(nonatomic,)UIView *dimView;

@end

NS_ASSUME_NONNULL_END
