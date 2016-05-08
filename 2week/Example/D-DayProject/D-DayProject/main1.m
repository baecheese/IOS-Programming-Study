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
void leapYear(int todayYear, int eventdayYear);
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
        
//        int yearGapNum = (eventdayYear) - (todayYear);
//        total += yearGapNum*365;//년도 gap에 따른 날짜->total로 +
        
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
        
        // 끝달 일수 ++
        total += eventdayDay;
        
        //2월이 있으면 윤년 계산
        if (check2month(todayMonth, eventdayMonth))
        {
            //윤년 계산
            leapYear(todayYear, eventdayYear);
        }
    }
    else if (todayYearAndMonth > eventdayYearAndMonth)
    {
        monthGap(eventdayYearAndMonth, todayYearAndMonth);
    }
}


// end는 start보다 무조건 크다 (앞에서 비교 완료 상태)
// intput : YYYYMM -> YYYY 비교 후, MM분석을 통해 DD 토탈 ++
// 2월은 윤년계산에서 다시 계산할 것
bool daysOfMonth (int todayYearAndMonth, int eventdayYearAndMonth)
{
    //MM
    int startMonth = todayYearAndMonth % 100;
    int endMonth = eventdayYearAndMonth % 100;
    
    if (isError(startMonth, endMonth))
    {
        printf("올바른 달이 아닙니다.");
        total = 0;
        return false;
    }
    
    // ----- 같은 년도이면서
    else if (todayYear == eventdayYear && startMonth+1 < endMonth)
    {
        monthlyDay(startMonth+1, endMonth);
        
        //시작 달 구하기
        startMonthDay(startMonth);
        
    }
    // --- 한 달 차이 날 때
    else if (startMonth+1 == endMonth)
    {
        startMonthDay(startMonth);
        total += eventdayDay;
    }
    
    // --- 달이 같을 때
    else if (startMonth == endMonth)
    {
        total = eventdayDay - todayDay;
    }

    // ----- 년도가 넘어갈 때
    else if (todayYear < eventdayYear)
    {
        monthlyDay(startMonth+1, 12);// startMonth다음달~12월
        monthlyDay(1, endMonth);// 1월~endMonth
        
        //시작 달 전체 - 시작달 날짜 --> 토탈++
        startMonthDay(startMonth);
    }
    
    return true;
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

//윤년 계산 ---------------todo
void leapYear(int todayYear, int eventdayYear)
{
    if (check2month(todayMonth, eventdayMonth))
    {
        if (todayYear < eventdayYear)
        {
            for (int i = todayYear; i <= eventdayYear; i++)
            {
                if (isLeapYear(i))//윤년이면
                {
                    total += -1;
                }
                else
                {
                    total += -2;
                }
            }
        }
        else if (todayYear == eventdayYear)
        {
            if (isLeapYear(todayYear))
            {
                total += (-1);
            }
            else
            {
                total += (-2);
            }
        }
    }
}

// 2월이 있나 체크 -> 있으면 윤달 계산으로 보내기
bool check2month(int todayMonth, int eventdayMonth)
{
    // 같은 년도 일 때
    
    if (todayYear == eventdayYear && todayMonth < eventdayMonth)
    {
        //윤년계산으로
        leapYear(todayYear, eventdayYear);
        //is2Month(todayMonth, eventdayMonth);
        return true;
    }
    // 다른 년도 일 때
    
    if (todayYear < eventdayYear)
    {
        leapYear(todayYear, eventdayYear);
        leapYear(todayYear, eventdayYear);
//        is2Month(todayMonth, 12);
//        is2Month(1, eventdayMonth);
        return true;
    }
    
    return false;
}


//bool is2Month(int starMonth, int endMonth)
//{
//    for (int i = starMonth; i <= endMonth; i++)
//    {
//        if (i == 2)//2월이면
//        {
//            //윤년계산으로
//            leapYear(todayYear, eventdayYear);
//            return true;
//        }
//    }
//    return true;
//}



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
