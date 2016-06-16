//
//  OneViewController.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "OneViewController.h"
#import "TabBarViewController.h"

@interface OneViewController () <UITextViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation OneViewController


/* tap -> 키보드 내려가기 */
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    NSLog(@"tap");
    [_textView endEditing:YES];
    self.data = self.textView.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 델리게이트 */
    self.textView.delegate = self;
    NSLog(@"OneViewController");
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    [self.oneLabel setText:[NSString stringWithFormat:@"%@", self.textView.text]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
