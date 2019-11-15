//
//  BaseNavViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/14.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = self;
    }
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationBar setBackgroundImage:createImageWithColor(UIColor.blueColor, 1, 1) forBarMetrics:(UIBarMetricsDefault)];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:UIColor.whiteColor}];
    self.navigationController.navigationBar.translucent = NO;
}

@end
