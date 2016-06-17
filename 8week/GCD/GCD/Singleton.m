//
//  Singleton.m
//  GCD
//
//  Created by 배지영 on 2016. 6. 17..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype) singleToneMehod
{
    // 스태틱 - 일반 힙 영역이 아닌 메모리 영역이 아예 다름. 그래서 유동적이지 않게 됨
    static Singleton *deaultValue = nil;
    
    // dispatch_once_t -> 한번 실행됫는지 아닌지만 표시하는 타입
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deaultValue = [[Singleton alloc]init];
    });
    
    return deaultValue;
}

@end
