//
//  OAuthTool.h
//  NSKeyedArchiverDemo
//
//  Created by 韩锐 on 17/3/4.
//  Copyright © 2017年 HanRui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuth.h"

@interface OAuthTool : NSObject


/**
 存储数据

 @param OAuth 需要储存的对象

 @return 是否储存成功
 */
+ (BOOL)saveOAuth:(OAuth *)OAuth;

/**
 @return 获取存储对象
 */
+ (OAuth *)OAuth;

/**
 删除所有归档
 */
+ (void)logOut;

@end
