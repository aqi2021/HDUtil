//
//  HDEncryHelper.m
//  HDUtil
//
//  Created by 黄山锋 on 2022/6/16.
//

#import "HDEncryHelper.h"
#include <CommonCrypto/CommonCrypto.h>

#define hd_salt @"dtfyu0ofd4450bjhkbjbhv6789HGKHJKihojLJUYi04875982jknGYUIHjl"

@implementation HDEncryHelper

#pragma mark - UTF8
+ (NSString *)utf8Encrypt:(NSData *)data {
    if (data.length > 0) {
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return @"";
}
+ (NSData *)utf8Decrypt:(NSString *)str {
    return [str dataUsingEncoding:NSUTF8StringEncoding];
}


#pragma mark - HEX
+ (NSString *)hexEncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self hexEncrypt:data];
}
+ (NSString *)hexEncrypt:(NSData *)data {
    NSUInteger length = data.length;
    NSMutableString *result = [NSMutableString stringWithCapacity:length * 2];
    const unsigned char *byte = data.bytes;
    for (int i = 0; i < length; i++, byte++) {
        [result appendFormat:@"%02X", *byte];
    }
    return result;
}
+ (NSData *)hexDecrypt:(NSString *)hexStr {
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    hexStr = [hexStr lowercaseString];
    NSUInteger len = hexStr.length;
    if (!len) return nil;
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [hexStr getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableData *result = [NSMutableData data];
    unsigned char bytes;
    char str[3] = { '\0', '\0', '\0' };
    int i;
    for (i = 0; i < len / 2; i++) {
        str[0] = buf[i * 2];
        str[1] = buf[i * 2 + 1];
        bytes = strtol(str, NULL, 16);
        [result appendBytes:&bytes length:1];
    }
    free(buf);
    return result;
}


#pragma mark - MD5
+ (NSString *)md5EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self md5Encrypt:data];
}
+ (NSString *)md5Encrypt:(NSData *)data {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



#pragma mark - SHA
+ (NSString *)sha1EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self sha1Encrypt:data];
}
+ (NSString *)sha1Encrypt:(NSData *)data {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)sha224EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self sha224Encrypt:data];
}
+ (NSString *)sha224Encrypt:(NSData *)data {
    unsigned char result[CC_SHA224_DIGEST_LENGTH];
    CC_SHA224(data.bytes, (CC_LONG)data.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA224_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)sha256EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self sha256Encrypt:data];
}
+ (NSString *)sha256Encrypt:(NSData *)data {
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, (CC_LONG)data.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)sha384EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self sha384Encrypt:data];
}
+ (NSString *)sha384Encrypt:(NSData *)data {
    unsigned char result[CC_SHA384_DIGEST_LENGTH];
    CC_SHA384(data.bytes, (CC_LONG)data.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)sha512EncryptForStr:(NSString *)str {
    NSData *data = [self utf8Decrypt:str];
    return [self sha512Encrypt:data];
}
+ (NSString *)sha512Encrypt:(NSData *)data {
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, (CC_LONG)data.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}


#pragma mark - HMAC
+ (NSString *)hmacEncryptForStr:(NSString *)str alg:(CCHmacAlgorithm)alg key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:alg key:key];
}
+ (NSString *)hmacEncrypt:(NSData *)data alg:(CCHmacAlgorithm)alg key:(NSString *)key {
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    CCHmac(alg, cKey, strlen(cKey), data.bytes, data.length, result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];
    for (int i = 0; i < size; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)hmacMD5EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgMD5 key:key];
}
+ (NSString *)hmacMD5Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgMD5 key:key];
}

+ (NSString *)hmacSHA1EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA1 key:key];
}
+ (NSString *)hmacSHA1Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA1 key:key];
}

+ (NSString *)hmacSHA224EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA224 key:key];
}
+ (NSString *)hmacSHA224Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA224 key:key];
}

+ (NSString *)hmacSHA256EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA256 key:key];
}
+ (NSString *)hmacSHA256Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA256 key:key];
}

+ (NSString *)hmacSHA384EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA384 key:key];
}
+ (NSString *)hmacSHA384Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA384 key:key];
}

+ (NSString *)hmacSHA512EncryptStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA512 key:key];
}
+ (NSString *)hmacSHA512Encrypt:(NSData *)data key:(NSString *)key {
    return [self hmacEncrypt:data alg:kCCHmacAlgSHA512 key:key];
}

// FIXME: AES加密解密还有问题，请勿使用
#pragma mark - AES
+ (NSString *)aes128EcbEncryptForStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    NSData *EncryptData = [self aes128EcbEncrypt:data key:key];
    return [self utf8Encrypt:EncryptData];
}
+ (NSString *)aes128EcbDecryptForStr:(NSString *)str key:(NSString *)key {
    NSData *data = [self utf8Decrypt:str];
    NSData *EncryptData = [self aes128EcbDecrypt:data key:key];
    return [self utf8Encrypt:EncryptData];
}
+ (NSData *)aes128EcbEncrypt:(NSData *)data key:(NSString *)key {
    return [self aesEcbEncrypt:data size:kCCKeySizeAES128 alg:kCCAlgorithmAES128 key:key];
}
+ (NSData *)aes128EcbDecrypt:(NSData *)data key:(NSString *)key {
    return [self aesEcbDecrypt:data size:kCCKeySizeAES128 alg:kCCAlgorithmAES128 key:key];
}

/*
ECB
*/
+ (NSData *)aesEcbEncrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg key:(NSString *)key {
    return [self aes:kCCEncrypt size:size data:data alg:alg opt:kCCOptionECBMode key:key iv:nil];
}
+ (NSData *)aesEcbDecrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg key:(NSString *)key {
    return [self aes:kCCDecrypt size:size data:data alg:alg opt:kCCOptionECBMode key:key iv:nil];
}

/*
CBC
*/
+ (NSData *)aesCbcEncrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg key:(NSString *)key iv:(NSString *)iv {
    return [self aes:kCCEncrypt size:size data:data alg:alg opt:kCCOptionPKCS7Padding key:key iv:iv];
}
+ (NSData *)aesCbcDecrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg key:(NSString *)key iv:(NSString *)iv {
    return [self aes:kCCDecrypt size:size data:data alg:alg opt:kCCOptionPKCS7Padding key:key iv:iv];
}


+ (NSData *)aesEncrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg opt:(CCOptions)opt key:(NSString *)key iv:(NSString *)iv {
    if (iv.length != 16 && iv.length != 0) {
        return nil;
    }
    return [self aes:kCCEncrypt size:size data:data alg:alg opt:opt key:key iv:iv];
}
+ (NSData *)aesDecrypt:(NSData *)data size:(int)size alg:(CCAlgorithm)alg opt:(CCOptions)opt key:(NSString *)key iv:(NSString *)iv {
    if (iv.length != 16 && iv.length != 0) {
        return nil;
    }
    return [self aes:kCCDecrypt size:size data:data alg:alg opt:opt key:key iv:iv];
}

/*
 CCCryptorStatus CCCrypt(
    CCOperation op,             kCCEncrypt 加密 / kCCDeccrypt 解密
    CCAlgorithm alg,            加密算法
    CCOptions options,          加密选项 ECB / CBC
    const void *key,            KEY的地址
    size_t keyLength,           KEY的长度
    const void *iv,             iv初始化向量
    const void *dataIn,         加密的数据
    size_t dataInLength,        加密数据的长度
    void *dataOut,              密文的内存地址
    size_t dataOutAvailable,    密文缓冲区的大小
    size_t *dataOutMoved        数据的指针（加密结果大小）
 )
 
 size:
 kCCKeySizeAES128          = 16,
 kCCKeySizeAES192          = 24,
 kCCKeySizeAES256          = 32,
 */
+ (NSData *)aes:(CCOperation)op size:(int)size data:(NSData *)data alg:(CCAlgorithm)alg opt:(CCOptions)opt key:(NSString *)key iv:(NSString *)iv {
    NSData *keyData = [self utf8Decrypt:key];
    NSData *ivData = [self utf8Decrypt:iv];
    
    NSData *result = nil;
    size_t bufferSize = data.length + size;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(op,
                                          alg,
                                          opt,
                                          keyData.bytes,
                                          keyData.length,
                                          iv ? ivData.bytes : NULL,
                                          data.bytes,
                                          data.length,
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc]initWithBytes:buffer length:encryptedSize];
    }
    free(buffer);
    
    return result;
}


#pragma mark - Base64
/// base64编码
+ (NSString *)base64Encrypt:(NSString *)str {
    NSData *data = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
    return [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64解码
+ (NSString *)base64Decrypt:(NSString *)base64Str {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64编码（url）
+ (NSString *)base64UrlEncrypt:(NSString *)str {
    NSData *data = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
    NSMutableString *base64Str = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return base64Str;
}
/// base64解码（url）
+ (NSString *)base64UrlDecrypt:(NSString *)str {
    NSMutableString *base64Str = [[NSMutableString alloc] initWithString:str];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    NSInteger mod4 = base64Str.length % 4;
    if (mod4) {
        [base64Str appendString:[@"====" substringToIndex:(4 - mod4)]];
    }
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
