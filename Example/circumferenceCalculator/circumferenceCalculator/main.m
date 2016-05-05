//
//  main.m
//  circumferenceCalculator
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

float radius = 0;//반지름
const float PI = 2;//파이 생략

float radiusInput (float userRadius);

float circumferenceCalculator()
{
    return radius * PI;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        radiusInput(123);
        printf("원 둘레는 %f파이 입니다.",circumferenceCalculator());
        
    }
    return 0;
    
}

float radiusInput (float userRadius)
{
    return radius = userRadius;
}