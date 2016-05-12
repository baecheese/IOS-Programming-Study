//
//  PrintDate.m
//  RoundNum
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "PrintDate.h"

@implementation PrintDate

//MMDD출력
-(void)printDateFuc:(NSUInteger)inputYear afterDay:(NSUInteger)inputDay
{
    
    if (365 - inputDay < 0) {
        
        NSUInteger year = inputYear;
        NSUInteger resultMonth;
        NSUInteger day = inputDay;
        NSUInteger resultDay;
        NSInteger tempDay;//가져올 체크 일자
        NSInteger count=1;
        
        //NSUInteger resultDay;//남은일자
        while (tempDay >= resultDay) {
            resultMonth = count;
            tempDay = monthlyDay(year, resultMonth);
            if (count == 1)
            {
                resultDay = inputDay - tempDay;
            }
            if (resultDay<tempDay)
            {
                resultMonth += 1;
                break;
            }
            resultDay -= tempDay;
            count++;
        }
        
        NSLog(@"%d년도의 %d 일 후는 %d 월 %d일 입니다.",year,inputDay,resultMonth,resultDay);
    }
    else
    {
        NSLog(@"년도가 넘어갑니다.");
    }
    
}


NSUInteger monthlyDay (NSUInteger year, NSUInteger month)
{
    int array[7] = {1, 3, 5, 7, 8, 10, 12};
    if (anyLike(month, array))
    {
        return 31;
    }
    else if (month == 2)
    {
        if (isLeapYear(year))
        {
            return 29;
        }
        else
        {
            return 28;
        }
    }
    else
    {
        return 30;
    }
}


bool anyLike(int i, int array[7])
{
    for (int j = 0; j < 7; j++)
    {
        if (i == array[j])
        {
            return true;
        }
    }
    return false;
}


bool isLeapYear(int year)
{
    return (year%4==0 && year%100!=0)||(year%400==0);
}


@end
