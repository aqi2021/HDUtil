#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HDUtil.h"
#import "HDDevice.h"
#import "HDDeviceInfo.h"
#import "HDEncryHelper.h"
#import "HDHelper.h"
#import "HDAppInfoMacro.h"
#import "HDFuncMacro.h"
#import "HDMacro.h"
#import "HDGcdTimer.h"
#import "HDOther.h"
#import "HDProxy.h"

FOUNDATION_EXPORT double HDUtilVersionNumber;
FOUNDATION_EXPORT const unsigned char HDUtilVersionString[];

