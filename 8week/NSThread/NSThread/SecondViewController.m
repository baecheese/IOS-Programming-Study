//
//  SecondViewController.m
//  NSThread
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic, strong) NSThread *thread;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 스레드로 돌림
    /*
     [NSThread detachNewThreadSelector:@selector(testThread:) toTarget:self withObject:nil];
     */
    
    /* 스레드 객체로 만들어서 하는 방법 */
     self.thread = [[NSThread alloc]
     initWithTarget:self selector:@selector(testThread:) object:nil];
     [self.thread start];
     
    
}

/*  */
-(void)testThread:(NSThread *)thread
{
    NSInteger i = 0;
    while (self.thread.isCancelled == NO) {
        i++;
        [self performSelectorOnMainThread:@selector(changeDisplay:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
    }
    
}

-(void)changeDisplay:(NSNumber *)number
{
    [self.countLabel setText:[NSString stringWithFormat:@"%@", number]];
}


- (IBAction)stopButton:(id)sender {
    
    NSLog(@"-------stop--------");
    [self.thread cancel];
    //self.thread = nil;
    
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
