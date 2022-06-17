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
#define HDSingleton_h  +(instancetype)shared;\
+(id)allocWithZone:(struct _NSZone *)zone NS_UNAVAILABLE;\
+(id)alloc NS_UNAVAILABLE;\
+(id)new NS_UNAVAILABLE;\
- (id)cooy NS_UNAVAILABLE;\

#if __has_feature(objc_arc) // arc环境

#define HDSingleton_m  +(instancetype)shared{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return [self shared];\
}\
\
- (id)copyWithZone:(nullable NSZone *)zone{\
return self;\
}\


#else // 非arc环境

#define HDSingleton_m  +(instancetype)shared{ \
static id instance = nil; \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance = [[self alloc] init];\
});\
return instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {\
return [self shared];\
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
