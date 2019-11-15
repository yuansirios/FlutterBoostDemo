//
//  WeakProxy.h
//  FlutterHybrid
//
//  Created by yuan on 2019/11/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakProxy : NSProxy

@property (weak,nonatomic,readonly)id target;

+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
