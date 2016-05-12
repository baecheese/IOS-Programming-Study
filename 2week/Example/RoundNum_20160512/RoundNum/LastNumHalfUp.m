//
//  LastNumHalfUp.m
//  RoundNum
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "LastNumHalfUp.h"

@implementation LastNumHalfUp

-(CGFloat)LastNumHalfUp:(CGFloat)num cipherNum:(CGFloat)inputNum
{
    // 소수점 몇 째자리
    NSInteger cipherNum = inputNum;
    
    //자리수-1*10
    NSInteger zealisu = 10*(cipherNum-1);
    
    //0.1의 자리수-1제곱
    CGFloat zea = 0.1;
    
    for (NSInteger i=1; i==cipherNum; i++)
    {
        zea = zea*0.1;
    }
    
    int step1 = (num*zealisu+0.5);
    CGFloat result = step1 * zea;
    
    return result;
}




@end
