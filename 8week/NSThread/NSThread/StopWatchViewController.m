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
@property (nonatomic) NSInteger number2;

@property (nonatomic, strong) NSThread *thread2;
@property (weak, nonatomic) IBOutlet UILabel *mutiThreadLabel;

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
     initWithTarget:self selector:@selector(watchAction:) object:self.thread];
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


// waitUntilDone NO
- (IBAction)waitNOBtn:(id)sender
{
    // 시작 또 누르면
    if (self.thread2 != nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"경고" message:@"현재 타이머 진행 중입니다. 멈추시고 다시 시작해주세요." delegate:self cancelButtonTitle:nil otherButtonTitles:@"YES", nil];
        
        // alert창을 띄우는 method는 show이다.
        [alert show];
    }
    else {
        /* 스레드 객체로 만들어서 하는 방법 */
        
        
        // 스레드 객체 생성 전에 만들어서 nil이 들어옴
        // 스레드로 구분 하는 것은 아니니 메소드 두개로 구분하는게 옳아 보인다.
        self.thread2 = [[NSThread alloc]
                       initWithTarget:self selector:@selector(watchAction:) object:self.thread2];
        [self.thread2 start];
    }
}

// 위에 number로 시작하게
-(void)watchAction:(NSThread *)thread
{
    while (self.thread.isCancelled || self.thread2.isCancelled == NO) {
        
        if (thread == self.thread) {
            self.number++;
        }
        if (thread == self.thread2) {
            self.number2++;
        }
        
        /* waitUntilDone이 YES면 main thread가 돌 때에는 main에 작업을 추가할 수 없다. 독점하는 것. */
        
        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:thread waitUntilDone:NO];
        [NSThread sleepForTimeInterval:1];
    }
    self.thread = nil;
    self.thread2 = nil;
}

-(void)changeDisplay:(NSThread *)thread
{
    if (thread == self.thread) {
        [self.countNumLabel setText:[NSString stringWithFormat:@"%ld", (long)self.number]];
    }
    else
    {
        [self.mutiThreadLabel setText:[NSString stringWithFormat:@"%ld", (long)self.number2]];
    }
    
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
