//
//  SecondViewController.m
//  Notification
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)okAction:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NSNotificationKey" object:self.textFiled.text];
    
//    [self.textFiled ];
    dispatch_queue_t singleQueue = dispatch_queue_create("wing", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(singleQueue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(singleQueue, ^{
        NSLog(@"2");
    });
    
    dispatch_async(singleQueue, ^{
        NSLog(@"3");
    });
    dispatch_async(singleQueue, ^{
        NSLog(@"4");
    });
    dispatch_async(singleQueue, ^{
        NSLog(@"5");
    });
}


// 옵저빙하고 있던 화면을 떠났을 때 가장 먼저 불리는 함수
-(void)dealloc
{
    NSLog(@"dealloc");
    // 나 자신의 옵저빙을 빼는 것
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
