//
//  HDGcdTimer.h
//  HDUtil
//
//  Created by 黄山锋 on 2022/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDGcdTimer : NSObject
@property (nullable, readonly, retain) id userInfo;
@property (nonatomic, assign, readonly) NSTimeInterval timeInterval;
// MARK: target方式
/// 初始化方法（target）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param aTarget 执行对象
/// @param aSelector 执行方法
/// @param userInfo 附带信息
/// @param repeats 是否重复
+ (HDGcdTimer *)timerWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)repeats;

/// 初始化方法（target）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param aTarget 执行对象
/// @param aSelector 执行方法
/// @param userInfo 附带信息
/// @param repeats 是否重复
/// @param queue 指定队列（默认主队列）
+ (HDGcdTimer *)timerWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)repeats queue:(dispatch_queue_t)queue;

/// 初始化方法（target）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param aTarget 执行对象
/// @param aSelector 执行方法
/// @param userInfo 附带信息
/// @param repeats 是否重复
/// @param queue 指定队列（默认主队列）
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)repeats queue:(dispatch_queue_t)queue;


// MARK: block方式
/// 初始化方法（block）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param repeats 是否重复
/// @param block 执行block
+ (HDGcdTimer *)timerWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)repeats block:(void (^)(HDGcdTimer *timer))block;


/// 初始化方法（block）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param repeats 是否重复
/// @param block 执行block
/// @param queue 执行队列（默认主队列）
+ (HDGcdTimer *)timerWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)repeats block:(void (^)(HDGcdTimer *timer))block queue:(dispatch_queue_t)queue;


/// 初始化方法（block）
/// @param interval 时间间隔
/// @param delay 延迟时间
/// @param repeats 是否重复
/// @param block 执行block
/// @param queue 执行队列（默认主队列）
- (instancetype)initWithTimeInterval:(NSTimeInterval)interval delay:(NSTimeInterval)delay repeats:(BOOL)repeats block:(void (^)(HDGcdTimer *timer))block queue:(dispatch_queue_t)queue;

/// 开启
- (void)fire;

/// 暂停
- (void)pause;

/// 销毁
/// 如果强引用了timer，注意要在dealloc中invalidate
- (void)invalidate;
@end

NS_ASSUME_NONNULL_END
