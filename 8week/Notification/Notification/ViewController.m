//
//  ViewController.m
//  Notification
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* NSNotificationCenter 객체 만들어 옵저버 추가 */
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText:) name:@"NSNotificationKey" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upkeyborad:) name:UIKeyboardDidShowNotification object:nil];
    
}

// 옵저빙하고 있던 화면을 떠났을 때??? 가장 먼저 불리는 함수
-(void)dealloc
{
    NSLog(@"dealloc");
    // 나 자신의 옵저빙을 빼는 것
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



/* post 받는 곳 */
-(void)changeText:(NSNotification *)noti
{
    self.label.text = noti.object;
}

-(void)upkeyborad:(NSNotification *)noti
{
    NSLog(@"show keyboard");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
