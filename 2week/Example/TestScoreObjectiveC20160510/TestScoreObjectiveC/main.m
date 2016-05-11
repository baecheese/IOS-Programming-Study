//
//  main.m
//  TestScoreObjectiveC
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalcuationScore.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //CalcuationScore를 객체로 만들고
        CalcuationScore *CalcuationClass = [[CalcuationScore alloc] init];
         
        //객체 메소드 실행
        [CalcuationClass addSubjectScore:100];
        [CalcuationClass addSubjectScore:85];
        [CalcuationClass addSubjectScore:90];
        
        CGFloat average = [CalcuationClass averageScore];
        NSLog(@"average = %f", average);
        
        [CalcuationClass returnTestGrade:100];
        NSString *level1 = [CalcuationClass returnTestGrade:100];
        
        //클래스 메소드
        CGFloat point = [CalcuationScore returnTestPoint:level1];
        NSLog(@"학점은 %f 입니다.", point);
        
        
        
    }
    return 0;
}
