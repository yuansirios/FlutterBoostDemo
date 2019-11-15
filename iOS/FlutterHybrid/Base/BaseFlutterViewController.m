//
//  BaseFlutterViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/14.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "BaseFlutterViewController.h"
#import "BaseFlutterViewController+Navgition.h"
#import "WeakProxy.h"

@interface BaseFlutterViewController ()<FlutterBinaryMessenger,FlutterStreamHandler>

@end

@implementation BaseFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"当前控制器 ---   %@  --- ",NSStringFromClass([self class]));
    });
    
    [self setLeftButtonWithTitle:@"返回"];
    
    [self setUpFlutterChannel];
}

- (void)dealloc{
    NSLog(@"控制器释放 ---   %@  --- ",NSStringFromClass([self class]));
}

- (void)setUpFlutterChannel{
    [self setupFlutterCallNative];
    [self setupNativeCallFlutter];
}

#pragma mark - *********** FlutterCallNative ***********

- (void)setupFlutterCallNative{
    FlutterMethodChannel *flutterCallNativeChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/flutterCallNative" binaryMessenger:self];
    
    [flutterCallNativeChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);
        if([@"flutterCallNative" isEqualToString:call.method]){
            result(@{@"key":@"flutter call native"});
        }
    }];
    
    FlutterMethodChannel *secondChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/secondflutterCallNative" binaryMessenger:self];
    
    [secondChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);
        if([@"secondflutterCallNative" isEqualToString:call.method]){
            result(@{@"key":@"second flutter call native"});
        }
    }];
}

#pragma mark - *********** NativeCallFlutter ***********

- (void)setupNativeCallFlutter{
    
    id obj = [WeakProxy proxyWithTarget:self];
    
    FlutterEventChannel *nativeCallFlutterChannel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/nativeCallFlutter" binaryMessenger:obj];
    [nativeCallFlutterChannel setStreamHandler:obj];
}

- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events{
    self.nativeCallFlutterBlock = events;
    return nil;
}

- (FlutterError*)onCancelWithArguments:(id)arguments {
    self.nativeCallFlutterBlock = nil;
    return nil;
}

- (void)callFluterWithName:(NSString *)name params:(id)params{
    if(self.nativeCallFlutterBlock){
        self.nativeCallFlutterBlock(@{@"name":name?:@"",@"params":params ?: [NSNull null]});
    }else{
        NSLog(@"nativeCallFlutterBlock 为空");
    }
}

@end
