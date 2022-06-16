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

#pragma mark - UTF8
+ (NSString *)utf8Encrypt:(NSData *)data;
+ (NSData *)utf8Decrypt:(NSString *)str;


#pragma mark - HEX
+ (NSString *)hexEncryptForStr:(NSString *)str;
+ (NSString *)hexEncrypt:(NSData *)data;
+ (NSData *)hexDecrypt:(NSString *)hexStr;


#pragma mark - MD5
+ (NSString *)md5EncryptForStr:(NSString *)str;
+ (NSString *)md5Encrypt:(NSData *)data;



#pragma mark - SHA
+ (NSString *)sha1EncryptForStr:(NSString *)str;
+ (NSString *)sha1Encrypt:(NSData *)data;

+ (NSString *)sha224EncryptForStr:(NSString *)str;
+ (NSString *)sha224Encrypt:(NSData *)data;

+ (NSString *)sha256EncryptForStr:(NSString *)str;
+ (NSString *)sha256Encrypt:(NSData *)data;

+ (NSString *)sha384EncryptForStr:(NSString *)str;
+ (NSString *)sha384Encrypt:(NSData *)data;

+ (NSString *)sha512EncryptForStr:(NSString *)str;
+ (NSString *)sha512Encrypt:(NSData *)data;


#pragma mark - HMAC
+ (NSString *)hmacEncryptForStr:(NSString *)str alg:(CCHmacAlgorithm)alg key:(NSString *)key;
+ (NSString *)hmacEncrypt:(NSData *)data alg:(CCHmacAlgorithm)alg key:(NSString *)key;

+ (NSString *)hmacMD5EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacMD5Encrypt:(NSData *)data key:(NSString *)key;

+ (NSString *)hmacSHA1EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacSHA1Encrypt:(NSData *)data key:(NSString *)key;

+ (NSString *)hmacSHA224EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacSHA224Encrypt:(NSData *)data key:(NSString *)key;

+ (NSString *)hmacSHA256EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacSHA256Encrypt:(NSData *)data key:(NSString *)key;

+ (NSString *)hmacSHA384EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacSHA384Encrypt:(NSData *)data key:(NSString *)key;

+ (NSString *)hmacSHA512EncryptStr:(NSString *)str key:(NSString *)key;
+ (NSString *)hmacSHA512Encrypt:(NSData *)data key:(NSString *)key;

// FIXME: AES加密解密还有问题，请勿使用
#pragma mark - AES
+ (NSString *)aes128EcbEncryptForStr:(NSString *)str key:(NSString *)key;
+ (NSString *)aes128EcbDecryptForStr:(NSString *)str key:(NSString *)key;
+ (NSData *)aes128EcbEncrypt:(NSData *)data key:(NSString *)key;
+ (NSData *)aes128EcbDecrypt:(NSData *)data key:(NSString *)key;


#pragma mark - Base64
/// base64编码
+ (NSString *)base64Encrypt:(NSString *)str;
/// base64解码
+ (NSString *)base64Decrypt:(NSString *)base64Str;
/// base64编码（url）
+ (NSString *)base64UrlEncrypt:(NSString *)str;
/// base64解码（url）
+ (NSString *)base64UrlDecrypt:(NSString *)str;


@end

NS_ASSUME_NONNULL_END
