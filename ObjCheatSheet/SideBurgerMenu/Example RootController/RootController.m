//
//  ViewController.m
//  SlideInMenuOBJC
//
//  Created by Erez Mizrahi on 28/10/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "RootController.h"
#import "MenuTableViewController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _slidein = [[SlideInTransition alloc]init];
}

- (IBAction)openMenuAction:(id)sender {
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"menu"];
    [vc setModalPresentationStyle: UIModalPresentationOverCurrentContext];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _slidein.isMenuOpen = NO;
    return _slidein;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _slidein.isMenuOpen = YES;
    return _slidein;
}

@end
