//
//  main.c
//  steakNew
//
//  Created by 배지영 on 2016. 5. 18..
//  Copyright © 2016년 baecheese. All rights reserved.
//

int main() {
    int n;
    scanf("%d",&n);
    
    int steak[n];
    int index=-1;
    
    for (int k=0; k<n; k++)
    {
        char cmd[100];
        scanf("%s",cmd);
        
        if (!strcmp(cmd,"push"))
        {
            int num;
            scanf("%d \n",&num);
            
            // push
            index++;
            steak[index] = num;
        }
        
        else if (!strcmp(cmd,"top"))
        {
            // top
            if (0 <= index)
            {
                int top = steak[index];
                printf("%d \n", top);
            }
            
            // 스텍에 정수가 없을 경우
            else if (-1 == index)
            {
                printf("-1 \n");
            }
        }
        
        else if (!strcmp(cmd,"size")) {
            // size
            printf("%d \n",index+1);
        }
        
        else if (!strcmp(cmd,"empty")) {
            // empty (비어있으면 1)
            if (0<=index)
            {
                printf("0 \n");
            }
            else
            {
                printf("1 \n");
            }
        }
        
        else if (!strcmp(cmd,"pop")) {
            // pop
            if (0 <= index)
            {
                int result = steak[index];
                printf("%d \n", result);
                
                index--;
            }
            //스텍에 데이터 없으면 -1
            else if (-1 == index)
            {
                printf("-1 \n");
            }
        }
    }
    return 0;
}

