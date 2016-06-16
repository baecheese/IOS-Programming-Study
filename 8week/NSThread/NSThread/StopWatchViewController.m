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

@end

@implementation StopWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)startBtnClik:(UIButton *)sender {
    
    /* 스레드 객체로 만들어서 하는 방법 */
    
     self.thread = [[NSThread alloc]
     initWithTarget:self selector:@selector(watchStart:) object:nil];
     [self.thread start];
    
    
}

- (IBAction)stopBtnClik:(UIButton *)sender {
    NSLog(@"-------stop--------");
    [self.thread cancel];
    //self.thread = nil;
}

-(void)watchStart:(NSThread *)thread
{
    NSLog(@"-------start--------");
    NSInteger i = 0;
    while (self.thread.isCancelled == NO) {
        i++;
        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
        [NSThread sleepForTimeInterval:1];
    }
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
