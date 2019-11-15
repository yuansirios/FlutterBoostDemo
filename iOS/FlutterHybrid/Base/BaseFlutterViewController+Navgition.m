//
//  BaseFlutterViewController+Navgition.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/14.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "BaseFlutterViewController+Navgition.h"

@implementation BaseFlutterViewController (Navgition)

- (void)setLeftButtonWithTitle:(NSString *)title{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) {
        backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -4,0, 0);
    }
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)onBack{
    if (self.navigationController) {
        if (self.navigationController.viewControllers.count == 1) {
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
