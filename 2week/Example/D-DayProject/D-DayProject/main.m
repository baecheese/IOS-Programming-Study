//
//  main.m
//  D-DayProject
//
//  Created by 배지영 on 2016. 5. 7..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void dDayInput(int today, int eventday);//숫자형식 YYYYMMDD
void monthGap(int todayMonth, int eventdayMonth);
bool daysOfMonth (int startMonth, int endMonth);
bool anyLike(int i, int array[]);
void DayGap(int todayDay, eventdayDay);
bool isError(int startMonth,int endMonth);
void monthlyDay (int start, int end);

bool isLeapYear(int year);
bool check2month(int todayMonth, int eventdayMonth);
bool is2Month(int starMonth, int endMonth);
void startMonthDay(int startMonth);

int total = 0;//마지막 함수에서 출력

int todayInput;
int eventdayInput;
int todayYear;
int eventdayYear;
int todayMonth;
int eventdayMonth;
int todayDay;
int eventdayDay;

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
        
        dDayInput(20160101, 20170321);
        printf(" --------- ");
        printf("D-Day %d 일 입니다. \n", total);
    }
    return 0;
}


//YYYYMMDD
void dDayInput(int today, int eventday)
{
    todayInput = today;
    eventdayInput = eventday;
    
    //YYYY
    todayYear = today / 10000;
    eventdayYear = eventday/10000;
    
    //MM
    todayMonth = (today%10000)/100;
    eventdayMonth = (eventday%10000)/100;
    
    // DD
    todayDay = today%100;
    eventdayDay = eventday%100;
    
    if (today == eventday) {
        total = 0;
    }
    
    else if ((12-todayMonth+1)+eventdayMonth >= 12)//12개월 이상인 경우
    {
        //YYYYMMDD
        monthGap(today, eventday);
    }
    else if ((12-todayMonth+1)+eventdayMonth < 12)//12개월 이하인 경우
    {
        // --- 일수 체크해서 total 업데이트 -> 윤달 체크도 마무리 하나 체크하기 --------------------------todo
    }
    else if (today > eventday)
    {
        //print("과거 이벤트에 대한 디데이 입니다.");
        dDayInput(eventday, today);
    }
}


//YYYYMMDD
void monthGap(int today, int eventday)
{
    //YYYYMM
    int todayYearAndMonth = today / 100;
    int eventdayYearAndMonth = eventday / 100;
    
    if (todayYearAndMonth < eventdayYearAndMonth)
    {
        
        // 달별 일수 ++
        monthlyDay(todayMonth+1, eventdayMonth);
        
        // 시작달 일수 ++
        startMonthDay(todayMonth);
        
    
    }
    else if (todayYearAndMonth > eventdayYearAndMonth)
    {
        monthGap(eventdayYearAndMonth, todayYearAndMonth);
    }
}

//시작 달 전체 - 시작달 날짜 --> 토탈++
void startMonthDay(int startMonth)
{
    int array[7] = {1, 3, 5, 7, 8, 10, 12};
    if (anyLike(startMonth, array))
    {
        total += (31-todayDay+1);
    }
    else
    {
        total += (30-eventdayDay+1);
    }
    
}


// 월별 날짜 계산
void monthlyDay (int year, int month)
{
    int array[7] = {1, 3, 5, 7, 8, 10, 12};
    if (anyLike(month, array))
    {
        total =+ 31;
    }
    else if (month == 2)
    {
        if (isLeapYear(year))
        {
            total =+  29;
        }
        else
        {
            total =+  28;
        }
    }
    else
    {
        total =+  30;
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


bool isError(int startMonth,int endMonth)
{
    return (12 < endMonth || 1 > startMonth);
}

bool isLeapYear(int year)
{
    return (year%4==0 && year%100!=0 && year%400==0);
}
