//
//  main.c
//  stack
//
//  Created by 배지영 on 2016. 5. 23..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#include <stdio.h>
int main(int argc, const char * argv[]) {
    
    int t;
    scanf("%d", &t);
    
    
    for (int k=0; k<t; k++)
    {
        char str[100];
        scanf("%s",str);
        int n = strlen(str);
        
        int count = 0;
        int nagative = 0;
        
        for (int i=0; i<n; i++)
        {
            if (str[i] == '(')
            {
                count += 1;
            }
            else
            {
                count -= 1;
            }
            if (count < 0)
            {
                nagative = 1;
            }
        }
        
        if ((nagative == 0) && (count == 0))
        {
            printf("YES\n");
        }
        else
        {
            printf("NO\n");
        }
    }
}
