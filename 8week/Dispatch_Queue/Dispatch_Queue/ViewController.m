//
//  ViewController.m
//  Dispatch_Queue
//
//  Created by 배지영 on 2016. 6. 17..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // gobal 큐를 가져옴
     //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);// 완전 랜덤
    // main
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    
    // time
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
    
    dispatch_after(time, queue, ^{
        for (int i=0; i<50; i++) {
            NSLog(@"%d",i);
        };
    });
    
    
    dispatch_async(queue, ^{
        NSLog(@"a");
    });
    
    dispatch_async(queue, ^{
        for (int i=0; i<50; i++) {
            NSLog(@"---- %d",i);
        }
    });
    
    dispatch_async(queue, ^{
        NSLog(@"b");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"c");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"d");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"5");
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
