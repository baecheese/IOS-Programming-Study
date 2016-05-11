//
//  CalcuationScore.h
//  TestScoreObjectiveC
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcuationScore : NSObject

- (void)addSubjectScore:(NSInteger)score;
- (CGFloat)averageScore;
- (NSString *)returnTestGrade:(NSInteger)score;

+ (CGFloat)returnTestPoint:(NSString *)grade;

@end
