//
//  main.m
//  Example0519
//
//  Created by 배지영 on 2016. 5. 19..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

const int maxValue = 30;
const int minValue = 10;

typedef NS_ENUM(NSInteger, StudentCount)
{
    StudentCountMax = 25,
    StudentCountMin = 10
};

//Fruits를 NSInteger로 어떤 유의미한 값을 주겠다. = NSInteger가 다들어가는 것
//숫자를 다른 걸 넣어도 함수에서 default로 보내지만 과일명을 다르게 하면 아예 오류가 난다. (짝지어진 과일 명이 없기 때문에)
typedef NS_ENUM(NSInteger, Fruits)
{
    FruitsApple = 100,
    FruitsPear,
    FruitsPeach,
    FruitsBanana,
    FruitsOrange
};


typedef NS_OPTIONS(NSInteger, FruitsOption)
{
    FruitsOptionApple = 1<<0, // 0000 0001
    FruitsOptionPear = 1<<1, // 0000 0010
    FruitsOptionPeach = 1<<2, // 0000 0100
    FruitsOptionBanana = 1<<3, // 0000 1000
    FruitsOptionOrange = 1<<4 // 0001 0000
};


void selectFruitsOption(FruitsOption options)
{
    if (options & FruitsOptionApple)
    {
        printf("사과 ");
    }
    if (options & FruitsOptionPear)
    {
        printf("배 ");
    }
    if (options & FruitsOptionPeach)
    {
        printf("복숭아 ");
    }
    if (options & FruitsOptionBanana)
    {
        printf("바나나 ");
    }
    if (options & FruitsOptionOrange)
    {
        printf("오렌지 ");
    }
    
    printf("가 선택되었습니다.\n");
}

// 열거형 이름을 파라미터로 넣어줌 -->  열거형 내의 값이라는 걸 인지
void chooseFruit(Fruits selectedFruit)
{
    switch (selectedFruit) {
        case FruitsApple:
            printf("apple \n");
            break;
        case FruitsPear:
            printf("pear \n");
            break;
        case FruitsPeach:
            printf("peach \n");
            break;
        case FruitsBanana:
            printf("banana \n");
            break;
        case FruitsOrange:
            printf("orange \n");
            break;
            
        default:
            printf("없어요 \n");
            break;
    }
}


bool canOpenClass(int numberOfStudent)
{
    if (numberOfStudent > StudentCountMax)
    {
        printf("최대 인원이 초과되었습니다. \n");
        return true;
    }
    else if (numberOfStudent < StudentCountMin)
    {
        printf("최소 인원이 충족되지 못했습니다. \n");
        return false;
    }
    printf("개강 완료 \n");
    printf("최소 수강 인원은 %d명이고, 최대 수강 인원은 %d입니다.\n", StudentCountMin, StudentCountMax);
    return true;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        canOpenClass(100);
        canOpenClass(10);
        canOpenClass(3);
        
        
        chooseFruit(FruitsApple);
        chooseFruit(FruitsBanana);
        chooseFruit(FruitsOrange);
        
        chooseFruit(100);
        chooseFruit(1);
        chooseFruit(101);
        
        
        selectFruitsOption(FruitsOptionOrange|FruitsOptionApple);//or연산
        selectFruitsOption(25);//or연산
        

        
        
    }
    return 0;
}



