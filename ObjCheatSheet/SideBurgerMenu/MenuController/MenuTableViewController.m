//
//  MenuTableViewController.m
//  SlideInMenuOBJC
//
//  Created by Erez Mizrahi on 28/10/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController


typedef NS_ENUM(NSInteger) {
    option1, option2, option3, option4
}Options;

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Options type = (Options)indexPath;
    NSLog(@"%ld", (long)type);
    [self dismissViewControllerAnimated:YES completion:^{
        return;
    }];
}



@end
