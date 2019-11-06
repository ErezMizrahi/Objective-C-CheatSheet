//
//  SlideInTransition.m
//  SlideInMenuOBJC
//
//  Created by Erez Mizrahi on 28/10/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "SlideInTransition.h"

@implementation SlideInTransition

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController* toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    float finalWidth = toController.view.bounds.size.width * 0.8;
    float finalHeight = toController.view.bounds.size.height;
    
    if (_isMenuOpen) {
        _dimView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        _dimView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:(0.0)];
        [containerView addSubview:_dimView];
        _dimView.frame = containerView.bounds;
        [containerView addSubview:toController.view];
        
        toController.view.frame = CGRectMake(-finalWidth, 0, finalWidth, finalHeight);
    }
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    BOOL isCancelled = transitionContext.transitionWasCancelled;
    
    [UIView animateWithDuration:duration animations:^{
        if (self->_isMenuOpen) {
            [self->_dimView setAlpha:0.7];
                   toController.view.transform = CGAffineTransformMakeTranslation(finalWidth, 0);
        } else {
            [self->_dimView setAlpha:0.0];
            fromController.view.transform = CGAffineTransformIdentity;
        }
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:!isCancelled];
    }];
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

@end
