//
//  main.m
//  FloorSpace
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

float squareMeter = 0;
float floorSpace = 0;

const float key = 0.325;

float squareMeterInput (float squareMeter);

// 평수 구하는 함수
float floorSpaceCalculator()
{
    float floorSpace = squareMeter * key;
    return floorSpace;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        squareMeterInput(1000);
        
        printf("사용자의 평수는 %f입니다.", floorSpaceCalculator());
        
    }
    return 0;
}



float squareMeterInput (float userSquareMeter)
{
    return squareMeter = userSquareMeter;
}



