//
//  OAuthTool.m
//  NSKeyedArchiverDemo
//
//  Created by 韩锐 on 17/3/4.
//  Copyright © 2017年 HanRui. All rights reserved.
//

#import "OAuthTool.h"

static NSString *const oauthPath = @"NSKeyedArchiver.data";

@implementation OAuthTool

+ (BOOL)saveOAuth:(OAuth *)OAuth {
    //获取doc的目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //拼接保存的路径
    NSString *filePath = [docPath stringByAppendingPathComponent:oauthPath];
    //存储返回用户信息
    return [NSKeyedArchiver archiveRootObject:OAuth toFile:filePath];
}

+ (OAuth *)OAuth {
    //获取doc的目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //拼接保存的路径
    NSString *filePath = [docPath stringByAppendingPathComponent:oauthPath];
    //获取用户存储的授权信息
    OAuth *oAuth = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (!oAuth) {
        oAuth = [[OAuth alloc]init];
    }
    return oAuth;
}

+ (void)logOut {
    //获取doc的目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //拼接保存的路径
    NSString *filePath = [docPath stringByAppendingPathComponent:oauthPath];
    //删除路径.data文件
    NSFileManager *fileManage = [NSFileManager defaultManager];
    [fileManage removeItemAtPath:filePath error:nil];
}

@end
