//
//  HDEncryHelper.h
//  HDUtil
//
//  Created by 黄山锋 on 2022/6/16.
//
//  content：加密解密

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HDEncryHelper : NSObject

#pragma mark - MD5
+ (NSString *)md5:(NSString *)str;
+ (NSString *)md5:(NSString *)str salt:(NSString *)salt;

#pragma mark - Base64
/// base64编码
+ (NSString *)base64Encode:(NSString *)str;
/// base64解码
+ (NSString *)base64Decode:(NSString *)str;
/// base64编码（url）
+ (NSString *)base64UrlEncode:(NSString *)str;
/// base64解码（url）
+ (NSString *)base64UrlDecode:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
