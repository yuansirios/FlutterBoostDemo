//
//  AppDelegate.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/4.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YSFlutterRouter.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc] init];
    BaseNavViewController *nv = [[BaseNavViewController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nv;
    [self.window makeKeyAndVisible];
    
    [YSFlutterRouter sharedRouter].navigationController = nv;
    
    return YES;
}

@end

