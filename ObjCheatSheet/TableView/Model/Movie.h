//
//  Movie.h
//  ObjCheatSheet
//
//  Created by Erez Mizrahi on 01/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) UIImage *image;

@end

NS_ASSUME_NONNULL_END
