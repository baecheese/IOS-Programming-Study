//
//  main.c
//  test
//
//  Created by 배지영 on 2016. 5. 18..
//  Copyright © 2016년 baecheese. All rights reserved.
//


#include <stdio.h>

int main() {
    int num;
    scanf("%d", &num);
    
    char *star = "*";
    char *temp = " ";
    
    //윗쪽
    for (int i=1; i<=num-1; i++)
    {
        //temp
        for (int t=1; t<=(num-i); t++)
        {
            printf("%s", temp);
        }
        
        //star
        int s = (2*i)-1;
        for (int n=1; n<=s; n++)
        {
            printf("%s", star);
        }
        printf("\n");
    }

    //중간
    for (int i=1; i<=(num*2)-1; i++)
    {
        printf("%s", star);
    }
    
    printf("\n");
    
    //뒷쪽 (4번)
    for (int i=1; i<=num-1; i++)
    {
        //temp
        for (int t=1; t<=i; t++)
        {
            printf("%s", temp);
        }
        
        //star
        int s = (2*num)-1;
        for (int n=i; n<=s-i-1; n++)
        {
            printf("%s", star);
        }
        printf("\n");
    }
    
    
    
}