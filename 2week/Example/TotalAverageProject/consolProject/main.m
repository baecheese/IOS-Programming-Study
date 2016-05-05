//
//  main.m
//  consolProject
//
//  Created by 배지영 on 2016. 5. 4..
//  Copyright © 2016년 me. All rights reserved.
//


// FloorSpace ---------

#import <Foundation/Foundation.h>


// 총점과 평균 구하기


// 변수 생성
float koreanScore = 0;
float mathScore = 0;
float scienceScore= 0;
float englishScore = 0;

// 각 과목 별 input 함수 생성
float koreanScoreinput (float newScore);
void mathScoreinput (float newScore);
void scienceScoreinput (float newScore);
void englishScoreinput (float newScore);

// 총합 함수
int totalScore()
{
    int total = koreanScore + mathScore + scienceScore + englishScore;
    
    return total;
}

// 평균 함수
float averageScore()
{
    return (totalScore()/4) ;
}

// 실행
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        koreanScoreinput(100);
        mathScoreinput(72);
        scienceScoreinput(22);
        englishScoreinput(15);
        
        printf("내 점수의 총합은 %d입니다.\n", totalScore());
        printf("내 점수의 평균은 %f입니다.", averageScore());
        
    }
    return 0;
    
}


// 함수를 통해 변수를 메모리가 아닌 함수 실행으로 바로 돌리게 하려고.
float koreanScoreinput (float newScore)
{
    koreanScore = newScore;
    return koreanScore;
}

void mathScoreinput (float newScore)
{
    mathScore = newScore;
}
void scienceScoreinput (float newScore)
{
    scienceScore = newScore;
}
void englishScoreinput (float newScore)
{
    englishScore = newScore;
}