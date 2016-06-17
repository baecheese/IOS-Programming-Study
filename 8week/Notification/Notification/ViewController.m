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
    
    /* NSNotificationCenter 객체 만들어 observer 추가 */
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText:) name:@"NSNotificationKey" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upkeyborad:) name:UIKeyboardDidShowNotification object:nil];
    
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
