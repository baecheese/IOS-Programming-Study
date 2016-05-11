//
//  ToolBoxClass.m
//  ToolBoxClass
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ToolBoxClass.h"

@implementation ToolBoxClass

// 숫자 받는 리스트
{
    NSMutableArray *numList;
}

//숫자 추가 함수
- (void)addNumList:(NSUInteger)num
{
    if (numList == nil)
    {
        numList = [[NSMutableArray alloc] initWithCapacity:1];
    }
    NSNumber *CalNum = [NSNumber numberWithInteger:num];
    [numList addObject:CalNum];
}

// 산술 메소드

// 덧셈만 리스트 받아서 하는 걸로 만들어 봄
- (NSInteger)additionNum
{
    NSInteger total = 0;
    for (NSNumber *num in numList)
    {
        total += num.integerValue;
    }
    return total;
}

// 뺄셈, 곱셈, 나눗셈은 파라미터 2개 받아서 하는 형태로 만들어봄

- (NSInteger)subtractionNum:(NSNumber *)num1 subNum2:(NSNumber*)num2
{
    NSInteger resultNum = (num1.integerValue - num2.integerValue);
    
    return resultNum;
}

- (NSInteger)multiplicationNum:(NSNumber *)num1 subNum2:(NSNumber *)num2
{
    NSInteger resultNum = (num1.integerValue * num2.integerValue);
    return resultNum;
}

// 소수점 3째 자리에서 반올림
- (CGFloat)divisionNum:(CGFloat)num1 subNum2:(CGFloat)num2
{
    CGFloat resultNum = ((num1/num2)*100+0.5)*0.01;

    return resultNum;
}


//치수전환 메소드

-(CGFloat)inchToCm:(CGFloat)inputInch
{
    CGFloat cm = inputInch * 2.54;
    
    return cm;
    
}

-(CGFloat)cmToInch:(CGFloat)InputCm
{
    CGFloat inch = InputCm * 0.3937;
    
    return inch;
    
}

-(CGFloat)M2ToFloorSpace:(CGFloat)InputM2
{
    CGFloat floor = InputM2 * 0.3025;
    return floor;
}

-(CGFloat)floorSpaceToM2:(CGFloat)Inputfloor
{
    CGFloat m2 = Inputfloor * 3.3058;
    return m2;
}


-(CGFloat)fahrenheiToCelsius:(CGFloat)InputFahrenheit
{
    CGFloat celsius = InputFahrenheit * -17.2;//섭씨
    return celsius;
}

-(CGFloat)celsiusToFahrenhei:(CGFloat)InputCelsius
{
    CGFloat fahrenheit = InputCelsius * 33.8;
    return fahrenheit;
}


-(CGFloat)KBToMB:(CGFloat)InputKB
{
    CGFloat MB = InputKB * 1024;
    return MB;
}

-(CGFloat)MBToKB:(CGFloat)InputMB
{
    CGFloat KB = InputMB * 0.0009765625;
    return KB;
}


@end
