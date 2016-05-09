//
//  main.m
//  D-DayProject
//
//  Created by 배지영 on 2016. 5. 7..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void dDayInput(int today, int eventday);//숫자형식 YYYYMMDD
bool daysOfMonth (int startMonth, int endMonth);
bool anyLike(int i, int array[]);
bool isError(int startMonth,int endMonth);
int monthlyDay (int year, int start, int end);

bool isLeapYear(int year);
int startMonthDay(int startMonth);

// result
int total = 0;//마지막 함수에서 출력

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        dDayInput(20160101, 20160319);
        printf(" --------- ");
    }
    return 0;
}


//YYYYMMDD
void dDayInput(int today, int eventday)
{
    //YYYY
    int todayYear = today / 10000;
    int eventdayYear = eventday/10000;
    
    //MM
    int todayMonth = (today%10000)/100;
    int eventdayMonth = (eventday%10000)/100;
    
    // DD
    int todayDay = today%100;
    int eventdayDay = eventday%100;
    
    //첫 달 일자, 끝 달 일자 ++ ----------------
    total += startMonthDay(todayMonth)-todayDay+1;//오늘포함
    total += eventdayDay;
    
    
    ///--- 년도 별 간격------------------------
    
    // 1년 이상일 때
    if (1 <= eventdayYear-todayYear)
    {
        total += (eventdayYear - todayYear)*365;
    }
    
    //년도가 같을 때(1년 이하, 개월 수에 따른)
    if (0 == eventdayYear-todayYear && 12 > todayMonth + eventdayMonth)
    {
        //2번째~마지막 바로 전까지
        int SecondMonth = todayMonth + 1;
        int PreeventdayMonth = eventdayMonth - 1;
        //secondMonth~preEventMonth
        total += monthlyDay(todayYear, SecondMonth, PreeventdayMonth);
        printf("D-Day는 %d 이다.",total);
    }
    
    ///------------------------------------
    
    if (today > eventday)
    {
        //스왑 ------> 부호 처리 나중에 어떻게 해야 하낭..움
        dDayInput(eventday, today);
    }
    
    if (today == eventday) {
        total = 0;
    }
}

//시작 달 전체
int startMonthDay(int startMonth)
{
    int array[7] = {1, 3, 5, 7, 8, 10, 12};
    if (anyLike(startMonth, array))
    {
        return 31;
    }
    else
    {
        return 30;
    }
    
}


// 월별 날짜 계산-------todo
int monthlyDay (int year, int start, int end)
{
    for (int i=start; i<=end; i++)
    {
        int month = i;
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
    return 0;
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


bool isError(int startMonth,int endMonth)
{
    return (12 < endMonth || 1 > startMonth);
}

bool isLeapYear(int year)
{
    return (year%4==0 && year%100!=0)||(year%400==0);
}
