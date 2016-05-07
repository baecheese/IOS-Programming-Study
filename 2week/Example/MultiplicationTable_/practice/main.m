//
//  main.m
//  practice
//
//  Created by 배지영 on 2016. 5. 5..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

void getMutiplicationTable(int num);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSLog(@"Hello, World!");
        getMutiplicationTable(8);
    }
    return 0;
}

void getMutiplicationTable(int num)
{
    for (int i=1; i<10; i++)
    {
        int k = i*num;
        printf("%d*%d=%d\n",num,i,k);
    }
}

