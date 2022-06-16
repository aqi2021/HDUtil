//
//  HDEncryHelper.m
//  HDUtil
//
//  Created by 黄山锋 on 2022/6/16.
//

#import "HDEncryHelper.h"

@implementation HDEncryHelper

#pragma mark - Base64
/// base64编码
+ (NSString *)base64Encode:(NSString *)str {
    NSData *data = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
    return [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64解码
+ (NSString *)base64Decode:(NSString *)base64Str {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Str options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64编码（url）
+ (NSString *)base64UrlEncode:(NSString *)str {
    NSData *data = [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
    NSMutableString *base64Str = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    base64Str = (NSMutableString * )[base64Str stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return base64Str;
}
/// base64解码（url）
+ (NSString *)base64UrlDecode:(NSString *)str {
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
