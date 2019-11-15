//
//  BaseFlutterViewController.h
//  FlutterHybrid
//
//  Created by yuan on 2019/11/14.
//  Copyright © 2019 yuan. All rights reserved.
//


#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFlutterViewController : FLBFlutterViewContainer<FLBPlatform>

@property(nonatomic, copy) FlutterEventSink nativeCallFlutterBlock;

- (void)callFluterWithName:(NSString *)name params:(id)params;

@end

NS_ASSUME_NONNULL_END
