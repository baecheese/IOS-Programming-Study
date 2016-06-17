//
//  ViewController.m
//  NSThread
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 바로 이걸 돌리면 이 부분이 끝나야 View가 보임
    /*
    for (int i = 0; i<100000; i++) {
        NSLog(@"%ld", (long)i);
    }
     */
    
    // 스레드로 돌림
    /*
    [NSThread detachNewThreadSelector:@selector(testThread:) toTarget:self withObject:nil];
     */
    
    /* 스레드 객체로 만들어서 하는 방법 */
    
    /*
    self.thread = [[NSThread alloc]
                   initWithTarget:self selector:@selector(testThread:) object:nil];
    [self.thread start];
     */
    
}



-(void)testThread:(NSThread *)thread
{
    for (int i = 0; i<100000; i++) {
        NSLog(@"%ld", (long)i);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
