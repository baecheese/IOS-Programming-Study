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
    char zark = '*';
    
    for (int i=1; i<=num; i++)
    {
        if (isZzark(i))
        {
            printf("%c ",zark);
            continue;
        }
        printf("%d ",i);
    }
}

// 1의 자릿수 구하기
int getFirstInteger(int num)
{
    return num % 10;
}

bool isZzark(int num)
{
    if (is369(num))
    {
        return true;
    }
    else if (num >= 10)
    {
        return isZzark(num / 10);
    }
    return false;
}

bool is369(int num)
{
    int first = getFirstInteger(num);
    return (first % 3 == 0 && first != 0);
}

