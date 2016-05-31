//
//  main.m
//  SieveOfEratosthenes
//
//  Created by 배지영 on 2016. 5. 25..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //소수 저장
    NSMutableArray *primes = [[NSMutableArray alloc] init];
    
    int p[100]; // 소수 저장
    int pn=0; // 소수의 개수
    bool c[101]; // 지워졌으면 true
    int n = 100; // 100까지 소수
    for (int i=2; i<=n; i++)
    {
        if (c[i] == false)
        {
            p[pn++] = i;
            for (int j = i*i; j<=n; j+=i)
            {
                c[j] = true;
            }
        }
        
    }
    
    for (int i=2; i<=n; i++)
    {
        if (c[i] == false) {
            [primes addObject:@"i"];
            NSLog(@"%d %d \n", i);
        }
        
    }
        
}
