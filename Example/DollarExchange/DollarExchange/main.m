//
//  main.m
//  DollarExchange
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

int money = 0;
int exchangeRate = 0;

int moneyInput(int userMoney);
int exchangeRateInput(int todayExchange);

float changeIntoDollars()
{
    return money * exchangeRate;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        moneyInput(1000);
        exchangeRateInput(1300);
        
        printf("변환환 달러는 %d입니다", changeIntoDollars);
        
    }
    return 0;
}


int moneyInput(int userMoney)
{
    return money = userMoney;
}

int exchangeRateInput(int todayExchange)
{
    return exchangeRate = todayExchange;
}
