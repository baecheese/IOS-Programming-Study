//
//  main.m
//  ObjectiveCBasic
//
//  Created by 배지영 on 2016. 5. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

//총점
NSUInteger totalSubject (NSArray *subjects)
{
    NSInteger totalScore = 0;
    for (NSNumber *score in subjects)
    {
        totalScore =+ score.integerValue;
    }
    return totalScore;
}


//평균
CGFloat averageSubject(NSArray *subjects)
{
    CGFloat total = (CGFloat)totalSubject(subjects);
    return total/subjects.count;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *subjectList = @[@100, @90, @34, @78, @89, @38, @91];
        
//        NSLog(@"%zd", totalSubject(subjectList));
//        NSLog(@"---------");
        NSLog(@"%f", averageSubject(subjectList));
        
        
    }
    return 0;
}
