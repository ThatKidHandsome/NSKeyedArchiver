//
//  OAuth.m
//  NSKeyedArchiverDemo
//
//  Created by 韩锐 on 17/3/4.
//  Copyright © 2017年 HanRui. All rights reserved.
//

#import "OAuth.h"
#import <objc/runtime.h>

@interface OAuth()<NSCoding>

@end

@implementation OAuth

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        //获取所有属性
        NSArray *porpertyArray = [self getAllProperty];
        for (NSString *name in porpertyArray) {
            //去掉属性名前面的_
            NSString *key = [name substringFromIndex:1];
            //设置约定的键值对 c+key
            [self setValue:[coder decodeObjectForKey:[NSString stringWithFormat:@"c%@",key]] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    //获取所有属性
    NSArray *porpertyArray = [self getAllProperty];
    for (NSString *name in porpertyArray) {
        //去掉属性名前面的_
        NSString *key = [name substringFromIndex:1];
        //设置约定的键值对 c+key
        [coder encodeObject:[self valueForKey:key] forKey:[NSString stringWithFormat:@"c%@",key]];
    }
}

//获得所有属性
- (NSArray *)getAllProperty {
    NSMutableArray *array = [[NSMutableArray alloc]init];
    unsigned int *count = malloc(sizeof(unsigned int));
    //调用runtime方法
    //Ivar:方法返回的对象内容对象，这里将返回一个Ivar类型的指针
    //class_copyIvarList 方法可以捕获到类的所有变量 将变量的数量存在一个 unsigned int指针中
    Ivar *mem = class_copyIvarList([self class], count);
    for (int i = 0; i < *count; i++) {
        //通过移动指针进行遍历
        Ivar var = * (mem + i);
        //获取变量的名称
        const char *name = ivar_getName(var);
        NSString *varStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        [array addObject:varStr];
    }
    //释放内存
    free(count);
    //注意处理野指针
    count = nil;
    return array;
}

@end
