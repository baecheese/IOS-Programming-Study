//
//  ToolBoxClass.h
//  ToolBoxClass
//
//  Created by 배지영 on 2016. 5. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolBoxClass : NSObject

- (void)addNumList:(NSUInteger)num;

- (NSInteger)additionNum;

- (NSInteger)subtractionNum:(NSNumber *)num1 subNum2:(NSNumber *)num2;
- (NSInteger)multiplicationNum:(NSNumber *)num1 subNum2:(NSNumber *)num2;
- (CGFloat)divisionNum:(CGFloat)num1 subNum2:(CGFloat)num2;

-(CGFloat)inchToCm:(CGFloat)inputInch;
-(CGFloat)cmToInch:(CGFloat)InputCm;
-(CGFloat)M2ToFloorSpace:(CGFloat)InputM2;
-(CGFloat)floorSpaceToM2:(CGFloat)Inputfloor;
-(CGFloat)fahrenheiToCelsius:(CGFloat)InputFahrenheit;
-(CGFloat)celsiusToFahrenhei:(CGFloat)InputCelsius;
-(CGFloat)KBToMB:(CGFloat)InputKB;
-(CGFloat)MBToKB:(CGFloat)InputMB;

@end
