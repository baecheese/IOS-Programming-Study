//
//  ReverseFunc.m
//  RoundNum
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ReverseFunc.h"

@implementation ReverseFunc

- (void)reverFunc:(NSUInteger)num
{
    NSUInteger tempOne;
    NSUInteger tempRest;
    NSUInteger tempResultNum;
    NSUInteger tempresultNum = 0;
    NSUInteger resultNum;
    
    tempOne = num%10;
    tempRest = num/10;
    tempresultNum = tempOne*10;
    
    while (tempRest%10 != 0)
    {
        tempOne = tempRest%10;
        tempRest = tempRest/10;
        tempresultNum = (tempresultNum+tempOne)*10;
    }
    
    resultNum = tempresultNum/10;

    
    NSLog(@"revers결과는 %d", resultNum);
}


@end
