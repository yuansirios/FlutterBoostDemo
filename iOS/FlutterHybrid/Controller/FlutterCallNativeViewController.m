//
//  FlutterCallNativeViewController.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/15.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "FlutterCallNativeViewController.h"

@interface FlutterCallNativeViewController ()<FlutterBinaryMessenger>

@end

@implementation FlutterCallNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFlutterCallNative];
}

#pragma mark - *********** FlutterCallNative ***********

#warning Flutter Call Native 建议单独控制器，一一对应的channelName

- (void)setupFlutterCallNative{
    FlutterMethodChannel *flutterCallNativeChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/secondflutterCallNative" binaryMessenger:self];
    
    [flutterCallNativeChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);
        if([@"secondflutterCallNative" isEqualToString:call.method]){
            result(@{@"key":@"second flutter call native"});
        }
    }];
}

@end
