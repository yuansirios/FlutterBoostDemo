//
//  NativeCallViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/15.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "NativeCallViewController.h"
#import "YSFlutterRouter.h"

@interface NativeCallViewController (){
    BaseFlutterViewController *_flutterVC;
}

@end

@implementation NativeCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内嵌Flutter页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = createBtn(@"native call flutter",@selector(nativeCall),self);
    btn.frame = CGRectMake(0, 80, 200, 40);
    [self.view addSubview:btn];
    
    [self performSelectorOnMainThread:@selector(showFlutter) withObject:nil waitUntilDone:NO];
}

- (void)nativeCall{
    [_flutterVC callFluterWithName:@"nativeCallFlutter" params:@{@"key":@"native call flutter"}];
}

- (void)showFlutter{
    _flutterVC = [[YSFlutterRouter sharedRouter]getFlutterVC:@"firstPage" params:@{@"key":@"123"}];
    _flutterVC.view.frame = CGRectMake(0, 150, self.view.frame.size.width, 400);
    [self.view addSubview:_flutterVC.view];
}

@end
