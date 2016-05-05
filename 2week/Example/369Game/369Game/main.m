//
//  main.m
//  369Game
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void game369(int num);

int getFirstInteger(int num);


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    game369(10);
    }
    return 0;
}

//29 이하의 369 게임
void game369(int num)
{
    char zark = '*';
    
    for (int i=1; i<30; i++)
    {
        int firstNum = getFirstInteger(i);
        if (firstNum % 3 == 0 && firstNum != 0)
        {
            printf("%c ",zark);
            continue;
        }
        printf("%d ",i);
    }
}

int getFirstInteger(int num)
{
    return num % 10;
}
