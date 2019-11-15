//
//  YSFlutterRouter.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/15.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "YSFlutterRouter.h"
#import "BaseNavViewController.h"

@implementation YSFlutterRouter

+ (instancetype)sharedRouter{
    static YSFlutterRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[YSFlutterRouter alloc] init];
        
        [FlutterBoostPlugin.sharedInstance
         startFlutterWithPlatform:_instance
         onStart:^(FlutterEngine *engine) {
            NSLog(@"engine:%@",engine);
        }];
    });
    return _instance;
}

#pragma mark - *********** push/pop/close ***********

- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion{
    BOOL animated = [exts[@"animated"] boolValue];
    BaseFlutterViewController *vc = BaseFlutterViewController.new;
    [vc setName:name params:params];
    vc.title = exts[@"title"];
    [self.navigationController pushViewController:vc animated:animated];
    if(completion) completion(YES);
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion{
    BOOL animated = [exts[@"animated"] boolValue];
    BaseFlutterViewController *vc = BaseFlutterViewController.new;
    [vc setName:name params:params];
    vc.title = exts[@"title"];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    BaseFlutterViewController *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:BaseFlutterViewController.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}

#pragma mark - *********** customer ***********

- (BaseFlutterViewController *)getFlutterVC:(NSString *)name
                                     params:(NSDictionary *)params{
    BaseFlutterViewController *vc = BaseFlutterViewController.new;
    [vc setName:name params:params];
    return vc;
}

- (void)open:(NSString *)name
   parameDic:(NSDictionary *)parameDic
    animated:(BOOL)animated
     present:(BOOL)present
    callBack:(void (^)(NSDictionary *dic))callBack
  completion:(void (^)(BOOL finished))completion{
    
    @try {
        NSMutableDictionary *mDic = parameDic.mutableCopy;
        [mDic setObject:@(present) forKey:@"present"];
        
        [FlutterBoostPlugin open:name
                       urlParams:mDic.copy
                            exts:@{@"animated":@(animated)}
                  onPageFinished:callBack
                      completion:completion];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
        
    }
}

- (void)close:(NSString *)name
    resultDic:(NSDictionary *)resultDic
     animated:(BOOL)animated
   completion:(void (^)(BOOL finished))completion{
    [FlutterBoostPlugin close:name
                       result:resultDic
                         exts:@{@"animated":@(animated)}
                   completion:completion];
}

@end

