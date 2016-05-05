//
//  main.m
//  practice
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void getMutiplicationTable(int num)
{
    for (int i=1; i<10; i++)
    {
        int k = i*num;
        printf("%d*%d=%d\n",num,i,k);
    }
}

int factoraler(int num)
{
    int i = 0;
    int result = 0;
    for (int i=1; i< num+1 ; i++)
    {
        result *= i;
    }
    return result;
}




void game(int num)
{
    char a = '*';
    for (int i=1; i<30; i++) {
        if (i < 10) {
            if ((i%3)==0) {
                printf("%c",a);
            }
            else {
            printf("%d",i);
            }
        }
        else if (i >= 10) {
            int y = i*0.1;
            if ((y%10)==3*i){
                printf("%c", a);
            }
            int z = y*0.1;
            if ((z/3)==0){
                printf("%c", a);
            }
            printf("%d",i);
        }
        //printf("%d",i);
    }
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        getMutiplicationTable(8);
        printf("%d",factoraler(3));
        game(10);
    }
    return 0;
}
