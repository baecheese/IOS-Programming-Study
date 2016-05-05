//
//  main.m
//  Factorial
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>


int factorial(int num);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        printf("값은 %d입니다.",factorial(3));
        
    }
    return 0;
}

int factorial(int num)
{
    int result = 1;
    for (int i=1; i< num+1 ; i++)
    {
        result *= i;
    }
    return result;
}
