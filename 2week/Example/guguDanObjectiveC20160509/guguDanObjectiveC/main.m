//
//  main.m
//  guguDanObjectiveC
//
//  Created by 배지영 on 2016. 5. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>


// 구구단 함수
void guguDan(NSArray *danList)
{
    for (NSNumber *num in danList)
    {
        NSInteger num1 = num.integerValue;
        for (NSInteger i=1; i<= 9; i++)
        {
            NSLog (@"%zd x %zd = %zd", num1, i, num1*i);
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 구해야 하는 단
        NSArray *upgradeGuGuDan = @[@3, @2, @7];
        
        guguDan(upgradeGuGuDan);
        
        
    
    }
    return 0;
}
