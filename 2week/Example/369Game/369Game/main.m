//
//  main.m
//  369Game
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void game369(int num);
bool is369(int num);

int getFirstInteger(int num);
bool isZzark(int num);
bool _isZzark(int num, bool flag);


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        game369(339);
        printf("-------------------------");
    }
    return 0;
}

void game369(int num)
{
    for (int i=1; i<=num; i++)
    {
        if (isZzark(i))
        {
            printf(", ");
            continue;
        }
        printf("%d ,",i);
    }
}

bool isZzark(int num)
{
    return _isZzark(num, false);
}

bool _isZzark(int num, bool flag)
{
    if (is369(num))
    {
        printf("*");
        flag = true;
    }
    if (num >= 10)
    {
        return _isZzark(num / 10, flag);
    }
    return flag;
}

bool is369(int num)
{
    int first = getFirstInteger(num);
    return (first % 3 == 0 && first != 0);
}

// 1의 자릿수 구하기
int getFirstInteger(int num)
{
    return num % 10;
}

