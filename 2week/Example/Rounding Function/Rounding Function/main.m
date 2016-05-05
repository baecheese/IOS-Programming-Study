//
//  main.m
//  Rounding Function
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>


float inputNum = 0;
float inputNumInput (float userNum);

//세번째 자리에서 반올림시키는 함수
float roundingFunction()
{
    int resultNum = ((inputNum*100)+0.5);
    return (resultNum)*0.01;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        inputNumInput(1.2345);
        printf("결과는 %f입니다", roundingFunction());
        
        
    }
    return 0;
}


float inputNumInput (float userNum)
{
    return inputNum = userNum;
}