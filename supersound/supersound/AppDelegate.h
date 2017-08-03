//
//  AppDelegate.h
//  supersound
//
//  Created by Mickey on 2017/8/3.
//  Copyright © 2017年 Mickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYXTabBarController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CYXTabBarController *dragVC;


+(AppDelegate *)sharedAppDelegate;


@end

