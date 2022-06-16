//
//  HDFuncMacro.h
//  Pods
//
//  Created by 黄山锋 on 2022/5/19.
//

#ifndef HDFuncMacro_h
#define HDFuncMacro_h


// MARK: 单例写法
#define HDSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
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
