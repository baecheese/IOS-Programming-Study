//
//  main.c
//  test2
//
//  Created by 배지영 on 2016. 5. 18..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#include <stdio.h>

int main() {
    int x,y;
    scanf("%d %d",&x, &y);
    
    int totalDay = checkMonth(x-1) + y;
    checkDay(totalDay);
    
}

int checkMonth(int x)
{
    int total = 0;
    for (int i=1; i<=x; i++)
    {
        switch (i) {
            case 1 :
            case 3 :
            case 5 :
            case 7 :
            case 8 :
            case 10 :
            case 12 :
                total += 31;
                break;
                
            case 4:
            case 6:
            case 9:
            case 11:
                total += 30;
                break;
                
            case 2:
                total += 28;
                break;
                
                
        }
    }
    return total;
}

int checkDay(int num)
{
    int day = num%7;
    switch (day) {
        case 0 :
            printf("SUN \n");
            break;
        case 1:
            printf("MON \n");
            break;
        case 2:
            printf("TUE \n");
            break;
        case 3:
            printf("WED \n");
            break;
        case 4:
            printf("THU \n");
            break;
        case 5:
            printf("FRI \n");
            break;
        case 6:
            printf("SAT \n");
            break;
    }
    return 0;
}


