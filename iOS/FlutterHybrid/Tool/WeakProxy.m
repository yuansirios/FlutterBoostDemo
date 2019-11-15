//
//  WeakProxy.m
//  FlutterHybrid
//
//  Created by yuan on 2019/11/5.
//  Copyright © 2019 yuan. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}

//获得方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}

//改变调用对象,也就是说,让消息实际上发给真正的实现这个方法的类

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [self.target respondsToSelector:aSelector];
}

@end
