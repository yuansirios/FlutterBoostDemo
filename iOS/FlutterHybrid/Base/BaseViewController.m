//
//  BaseViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/15.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseFlutterViewController+Navgition.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"当前控制器 ---   %@  --- ",NSStringFromClass([self class]));
    });
}

- (void)dealloc{
    NSLog(@"控制器释放 ---   %@  --- ",NSStringFromClass([self class]));
}

@end
