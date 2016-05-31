//
//  main.c
//  Queue
//
//  Created by 배지영 on 2016. 5. 23..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int n;
    scanf("%d",&n);
    
    int begin = 0;
    int end = 0;
    
    int data[1000];
    
    for (int i=0;i<n;i++)
    {
        char cmd[1000];
        scanf("%s",cmd);
        
        if (!strcmp(cmd,"pop"))
        {
            if (begin == end)
            {
                printf("-1\n");
            }
            else
            {
            printf("%d\n", data[begin]);
            begin += 1;
            }
        }
        else if (!strcmp(cmd,"size"))
        {
            printf("%d\n", end - begin);
        }
        else if (!strcmp(cmd,"empty"))
        {
            if (begin == end)
            {
                printf("%d\n", 1);
            }
            else
            {
                printf("%d\n", 0);
            }
        }
        else if (!strcmp(cmd,"front"))
        {
            if (begin == end)
            {
                printf("%d\n", -1);
            }
            else
            {
            printf("%d\n", data[begin]);
            }
        }
        else if (!strcmp(cmd,"back"))
        {
            if (begin == end)
            {
                printf("%d\n", -1);
            }
            else
            {
                printf("%d\n", data[end-1]);
            }
        }
        else
        {
            int num;
            scanf("%d",&num);
            data[end] =num;
            end += 1;
        }
    }
}
