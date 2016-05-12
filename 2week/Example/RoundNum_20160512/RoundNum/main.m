//
//  main.m
//  RoundNum
//
//  Created by 배지영 on 2016. 5. 12..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LastNumHalfUp.h"
#import "PrintDate.h"
#import "ReverseFunc.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        LastNumHalfUp *LastNumHalfUpClass = [[LastNumHalfUp alloc] init];
        NSLog(@"%f",[LastNumHalfUpClass LastNumHalfUp:2.19 cipherNum:2]);
        
        PrintDate *printDateFuc = [[PrintDate alloc]init];
        [printDateFuc printDateFuc:2016 afterDay:70];
        
        ReverseFunc *reverseClass = [[ReverseFunc alloc]init];
        [reverseClass reverFunc:1234];
        
        
    }
    return 0;
}




