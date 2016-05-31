//
//  MyTestClass.m
//  Test0517
//
//  Created by 배지영 on 2016. 5. 17..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

// alloc과 delalloc을 override
+(instancetype) alloc
{
    NSLog(@"My Test Class alloc");
    
    [self testClassMethod]; //클래스 메소드
    [MyTestClass testClassMethod];
    
    return [super alloc];
}

- (void) dealloc
{
    NSLog(@"My Test Class Dealloc");

    // 사용하고 있던 메모리 공간을 해제해줘야 할 때
    // 객체가 메모리에서 해제되는 시점을 파악해야 할 때
    
//    [super dealloc];
// 원래를 위해 프로그래머는 dealloc을 호출하지 않는 것이 원칙
// 이렇게 이렇게 재정의하면 없어지는게 맞지만 dealloc은 특별한 케이스. 이렇게 재정의해도 자동으로 dealloc기능은 된다.
    
    [self testInstanceMethod];
//    [self testClassMethod]; //호출불가
    
}

-(void)testInstanceMethod
{
    NSLog(@"testInstanceMethod call");
}

+(void)testClassMethod
{
    NSLog(@"testClassMethod call");
}

@end
