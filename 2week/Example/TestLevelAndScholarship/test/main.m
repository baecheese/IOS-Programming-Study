//
//  main.m
//  test
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>


// 등급 매기기
int testLevel(float score);

// 장학금 주기
void scholarshipWithGrade(int level);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        printf("시험 등급은는 %d등급 입니다.\n",testLevel(100));
        scholarshipWithGrade(1);
        scholarshipWithGrade(2);
        scholarshipWithGrade(4);
    }
    return 0;
}


void scholarshipWithGrade(int level)
{
    switch (level) {
        case 1:
            printf("전액장학금\n");
            break;
        case 2:
            printf("50%% 장학금\n");
            break;
        case 3:
            printf("30%% 장학금\n");
            break;
        case 4:
            printf("10%% 장학금\n");
            break;
        default:
            printf("장학금 비대상자");
            break;
    }
}

int testLevel(float score)
{
    if (100>score>90)
    {
        return 1;
    }
    else if(score > 70)
    {
        return 2;
    }
    else if (score > 50)
    {
        return 3;
    }
    else if (score > 30)
    {
        return 4;
    }
    else
    {
        return 5;
    }
    return 0;
}
