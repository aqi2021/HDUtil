//
//  HDFuncMacro.h
//  Pods
//
//  Created by 黄山锋 on 2022/5/19.
//

#ifndef HDFuncMacro_h
#define HDFuncMacro_h


// MARK: ScrollView适配
#define  HDAdjustScrollView(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)


// MARK: 单例写法
#define HDSingleton_h(name)  +(instancetype)shared##name;

#if __has_feature(objc_arc) // arc环境
#define HDSingleton_m(name)  +(instancetype)shared##name{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone{\
return self;\
}
#else // 非arc环境

#define HDSingleton_m(name)  +(instancetype)shared##name{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
static id instance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}\
\
+ (id)copyWithZone:(nullable NSZone *)zone{\
return self;\
}\
+ (oneway void)release {\
}\
\
+ (instancetype)autorelease {\
return self;\
}\
\
+ (instancetype)retain {\
return self;\
}\
\
+ (NSUInteger)retainCount {\
return 1;\
}
#endif


#endif /* HDFuncMacro_h */
