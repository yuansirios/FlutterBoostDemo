//
//  YSFlutterRouter.h
//  FlutterHybrid
//
//  Created by yuan on 2019/11/15.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>
#import "BaseFlutterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FLBPlatform;

@interface YSFlutterRouter : NSObject<FLBPlatform>

@property(nonatomic, strong) UINavigationController *navigationController;

+ (instancetype)sharedRouter;

#pragma mark - *********** customer ***********

- (BaseFlutterViewController *)getFlutterVC:(NSString *)name
                                     params:(NSDictionary *)params;

/// 打开页面，传参并带返回值
/// @param name 页面标识
/// @param parameDic 参数Dic
/// @param animated 动画
/// @param present 模态
/// @param callBack 参数回调
/// @param completion 状态回调
- (void)open:(NSString *)name
   parameDic:(NSDictionary *)parameDic
    animated:(BOOL)animated
     present:(BOOL)present
    callBack:(void (^)(NSDictionary *dic))callBack
  completion:(void (^)(BOOL finished))completion;

/// 关闭页面
/// @param name 页面标识
/// @param resultDic 回调参数
/// @param animated 动画
/// @param completion 状态回调
- (void)close:(NSString *)name
    resultDic:(NSDictionary *)resultDic
     animated:(BOOL)animated
   completion:(void (^)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END
