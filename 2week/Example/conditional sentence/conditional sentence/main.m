//
//  main.m
//  conditional sentence
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

//절대값 구하기
int absoluteNum (float num)
{
    if (num < 0)
    {
        return num * -1;
    }
    else
    {
        return num;
    }
}


//문자 구분
void checkAlphabet (char alpa)
{
    if ('A'<= alpa && alpa <='Z')
    {
        printf("대문자입니다");
    }
    else if ('a'<= alpa && alpa <='z')
    {
        printf("소문자입니다");
    }
    else
    {
        printf("숫자");
    }
}


//윤년 구하는 문제
bool checkLeapYear (int yearnum)
{
    if ((yearnum/4==0)||((yearnum%100)==0)||((yearnum/400)==0))
    {
        printf("윤년");
        return (true);
    }
    else
    {
        printf("윤년아님");
        return false;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        printf("절대값은 %d입니다.", absoluteNum(-123));
        checkAlphabet('A');
        checkAlphabet('1');
        checkLeapYear(1955);
        
    }
    return 0;
}
