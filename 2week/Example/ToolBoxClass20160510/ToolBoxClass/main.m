//
//  main.m
//  ToolBoxClass
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ToolBoxClass.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //-------- 더하기는 리스트로 받아서 만들어 보았다 ---------//
        ToolBoxClass *ToolBox = [[ToolBoxClass alloc] init];
        [ToolBox addNumList:100];
        [ToolBox addNumList:80];
        
        NSInteger totalAdd = [ToolBox additionNum];
        NSLog(@"%d", totalAdd);
        
        //-------- 나머지 산술연산은 다중 매개변수로 만들어 보았다 ---------//
        NSNumber *num1 = @1000;
        NSNumber *num2 = @50;
        
        NSInteger sub = [ToolBox subtractionNum:num1 subNum2:num2];
        NSInteger mul = [ToolBox multiplicationNum:num1 subNum2:num2];
        CGFloat div = [ToolBox divisionNum:100 subNum2:53];
        
        NSLog(@"빼기 값은 %d", sub);
        NSLog(@"곱하기 값은 %d", mul);
        NSLog(@"나누기 값은 %f", div);
        
        // --------------- 치수전환 --------------//
        
        NSLog(@"10inch -> %f cm", [ToolBox inchToCm:10]);
        NSLog(@"10cm -> %f inch", [ToolBox cmToInch:10]);
        NSLog(@"10m2 -> %f 평", [ToolBox M2ToFloorSpace:10]);
        NSLog(@"10평 -> %f m2", [ToolBox floorSpaceToM2:10]);
        NSLog(@"10KB -> %f MB", [ToolBox KBToMB:10]);
        NSLog(@"10MB -> %f KB", [ToolBox MBToKB:10]);
        
    }
    return 0;
}
