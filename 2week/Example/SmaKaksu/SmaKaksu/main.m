//
//  main.m
//  SmaKaksu
//
//  Created by 배지영 on 2016. 5. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

int samKuksu (int num);
int samKuksu2 (int num1, int num2);
int addAllNum(int num);
int addAllNum1(int num);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        printf("%d\n", samKuksu(10));
        printf("%d\n", samKuksu2(1,10));
        printf("%d\n", addAllNum(123));
        
        printf("----------------\n");

        printf("%d", addAllNum1(123));
    }
    return 0;
}


int samKuksu (int num)
{
    int resultNum = 0;
    for(int i=1; i<=num; i++)
    {
        resultNum += i;
    }
    return resultNum;
};

int samKuksu2 (int num1, int num2)
{
    int resultNum = 0;
    for(int i=num1; i<=num2; i++)
    {
        if (i%5==0){
            resultNum += i;
        }
        else {
            continue;
        }
    }
    return resultNum;
}


// 각 자리수 더하기: 재귀로 구하기

int realTotal = 0;

int addAllNum(int num)
{
    int temp = num;
    if (temp >= 10)
    {
        temp = num % 10;
        realTotal += temp;
        temp = num / 10;
        return addAllNum(temp);
    }
    if (temp < 10)
    {
        temp = num % 10;
        realTotal += temp;
        temp = num / 10;
    }
    return realTotal;
}

int realTotal1 = 0;

// -- 각자리수 더하기: 반복문으로 구하기
int addAllNum1(int num)
{
    int temp = num;
    
    while (temp > 0) {
        realTotal1 += temp % 10;
        temp = temp / 10;
    }
    
    return realTotal1;
}

int swipAndTotalAdd (int num)
{
    return 0;
}