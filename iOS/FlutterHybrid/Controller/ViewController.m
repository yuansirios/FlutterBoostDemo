//
//  ViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/4.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YSFlutterRouter.h"
#import "NativeCallViewController.h"
#import "FlutterCallNativeViewController.h"

@interface ViewController ()
 
@end
 
@implementation ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FlutterBoost示例";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = createBtn(@"push页面，传参",@selector(pushVC),self);
    btn.frame = CGRectMake(0, 80, 200, 40);
    [self.view addSubview:btn];
    
    UIButton *btn1 = createBtn(@"present页面，传参",@selector(presentVC),self);
    btn1.frame = CGRectMake(0, CGRectGetMaxY(btn.frame) + 20, 200, 40);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = createBtn(@"push页面，传参回参",@selector(pushWithPragma),self);
    btn2.frame = CGRectMake(0, CGRectGetMaxY(btn1.frame) + 20, 200, 40);
    [self.view addSubview:btn2];
    
    UIButton *btn3 = createBtn(@"present页面，传参回参",@selector(presentWithPragma),self);
    btn3.frame = CGRectMake(0, CGRectGetMaxY(btn2.frame) + 20, 200, 40);
    [self.view addSubview:btn3];
    
    UIButton *btn4 = createBtn(@"NativeCallFlutter",@selector(nativeCall),self);
    btn4.frame = CGRectMake(0, CGRectGetMaxY(btn3.frame) + 20, 200, 40);
    [self.view addSubview:btn4];
    
    UIButton *btn5 = createBtn(@"FlutterCallNative",@selector(flutterCall),self);
    btn5.frame = CGRectMake(0, CGRectGetMaxY(btn4.frame) + 20, 200, 40);
    [self.view addSubview:btn5];
}

#pragma mark - *********** Event ***********

- (void)pushVC {
    [[YSFlutterRouter sharedRouter] open:@"firstPage"
                                   urlParams:@{@"key":@"123"}
                                        exts:@{@"animated":@(YES),@"title":@"firstPage"}
                                  completion:^(BOOL finished) {
        
    }];
}

- (void)presentVC{
    [[YSFlutterRouter sharedRouter] present:@"secondPage"
                                      urlParams:@{@"key":@"123"}
                                           exts:@{@"animated":@(YES),@"title":@"secondPage"}
                                     completion:^(BOOL finished) {
        
    }];
}

- (void)pushWithPragma{
    
    NSDictionary *parame = @{@"key":@"我是参数"};
    
    [[YSFlutterRouter sharedRouter] open:@"infoPage"
                                   parameDic:parame
                                    animated:YES
                                     present:NO
                                    callBack:^(NSDictionary * _Nonnull dic) {
        NSLog(@"infoPage返回的参数：%@",dic);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)presentWithPragma{
    NSDictionary *parame = @{@"key":@"我是参数"};
    [[YSFlutterRouter sharedRouter] open:@"infoPage"
                                   parameDic:parame
                                    animated:YES
                                     present:YES
                                    callBack:^(NSDictionary * _Nonnull dic) {
        NSLog(@"infoPage返回的参数：%@",dic);
    } completion:^(BOOL finished) {
        
    }];
}
 
- (void)nativeCall{
    [self.navigationController pushViewController:NativeCallViewController.new animated:YES];
}

- (void)flutterCall{
    FlutterCallNativeViewController *vc = FlutterCallNativeViewController.new;
    [vc setName:@"secondPage" params:@{@"key":@"我是参数"}];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
