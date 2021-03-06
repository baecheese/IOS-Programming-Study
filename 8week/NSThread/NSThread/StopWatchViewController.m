//
//  StopWatchViewController.m
//  NSThread
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "StopWatchViewController.h"

@interface StopWatchViewController ()

@property (nonatomic, strong) NSThread *thread;
@property (weak, nonatomic) IBOutlet UILabel *countNumLabel;
@property (nonatomic) NSInteger number;

@end

@implementation StopWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 첫 시작 숫자 = 0
    self.number = 0;
    
}

// 시작
- (IBAction)startBtnClik:(UIButton *)sender {
    // 시작 또 누르면
    if (self.thread != nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"경고" message:@"현재 타이머 진행 중입니다. 멈추시고 다시 시작해주세요." delegate:self cancelButtonTitle:nil otherButtonTitles:@"YES", nil];
        
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    else {
    /* 스레드 객체로 만들어서 하는 방법 */
     self.thread = [[NSThread alloc]
     initWithTarget:self selector:@selector(watchAction:) object:nil];
     [self.thread start];
    }
}

// 멈춤 버튼
- (IBAction)stopBtnClik:(UIButton *)sender {
    [self.thread cancel];
    
    // 멈춤하며 내부 number에 값 저장
    self.number = [self.countNumLabel.text integerValue];
    
    NSLog(@"-------stop--------");
}

// reset
- (IBAction)reset:(UIButton *)sender {
    [self.thread cancel];
    self.number = 0;
    self.countNumLabel.text = @"0";
    
    NSLog(@"-------reset--------");
}

// 위에 number로 시작하게
-(void)watchAction:(NSThread *)thread
{
    NSInteger i = self.number;
    while (self.thread.isCancelled == NO) {
        i++;
        /* waitUntilDone이 YES면 main thread가 돌 때에는 main에 작업을 추가할 수 없다. 독점하는 것. */
        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
        [NSThread sleepForTimeInterval:1];
    }
    self.thread = nil;
}

-(void) changeDisplay:(NSNumber *)number
{
    [self.countNumLabel setText:[NSString stringWithFormat:@"%@", number]];
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
