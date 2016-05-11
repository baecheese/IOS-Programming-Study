//
//  CalcuationScore.m
//  TestScoreObjectiveC
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "CalcuationScore.h"

@implementation CalcuationScore

// 과목 리스트
{
    NSMutableArray *subjectsList;
}

//과목 점수 추가 함수
- (void)addSubjectScore:(NSInteger)score
{
    //초기화
    if (subjectsList == nil)
    {
        subjectsList = [[NSMutableArray alloc] initWithCapacity:1];
        //initWithCapacity 지정 -> 1정도 들어간다고 지정
        //사실 자동적으로 늘어난다.
    }
    //NSNumber(참조형 타입)으로 변환
    // NSNumber로 변환 방법 1)  @1  2) 변수일 땐 numberWithInteger 메소드 사용
    //numberWithInteger는 NSNumber Class Method
    NSNumber *scoreNum = [NSNumber numberWithInteger:score];
    
    //array에 추가
    [subjectsList addObject:scoreNum];
}

// 과목총점 메소드
- (NSInteger)totalScore
{
    NSInteger totalScore = 0;
    for (NSNumber *score in subjectsList)
    {
        totalScore += score.integerValue;
    }
    return totalScore;
}

//평균 구하는 메소드
- (CGFloat)averageScore
{
    //과목의 점수가 1이상일 때
    if (subjectsList.count > 0)
    {
        CGFloat averageS = ((CGFloat)[self totalScore]) / subjectsList.count;
        return averageS;
    }
    //과목점수가 없을 때
    else
    {
        return 0;
    }
}

//등급 반환 메소드
- (NSString *)returnTestGrade:(NSInteger)score
{
    NSString *grade;
    
    if (score>90)
    {
        grade = (NSString *)@"A+";
    }
    else if (score>80)
    {
        grade = (NSString *)@"B";
    }
    else if (score>60)
    {
        grade = (NSString *)@"C";
    }
    else
    {
        grade = (NSString *)@"D";
    }

    NSLog(@"%@", grade);
    return grade;
}

//등급 받아서 학점으로 변환해주는 메소드
+ (CGFloat)returnTestPoint:(NSString *)grade
{
    CGFloat point;
    
    if ([grade isEqualToString: @"A+"])
    {
        point = 4.5;
    }
    else if ([grade isEqualToString: @"B"])
    {
        point = 4.0;
    }
    else if ([grade isEqualToString: @"C"])
    {
        point = 3.5;
    }
    else if ([grade isEqualToString: @"D"])
    {
        point = 3.0;
    }

    return point;
    
}


@end
