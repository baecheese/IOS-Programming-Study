//
//  ViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.idTf.tag = 1;
    self.idTf.delegate = self;
    
    self.pwTf.tag = 2;
    self.pwTf.delegate = self;
    
}

NSInteger count_login = 0;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    count_login++;
    
    if (count_login == 1)
    {
    const CGFloat loginW = self.loginView.frame.size.width;
    const CGFloat loginH = self.loginView.frame.size.height;
        
    __weak ViewController *wself = self;
        
    // 위협 멘트 및 로그인 화면 애니메이션
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^
                    {
                        [wself.loginView setFrame:CGRectMake(0, 0, loginW, loginH)];
                        _tttt.alpha = 0;
                        _kikiLb.alpha = 1;
                        
                    } completion:^(BOOL finished) {}];
    }
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 1)
    {
        [_pwTf becomeFirstResponder];
    }
    if (textField.tag == 2)
    {
        [_pwTf resignFirstResponder];
        count_login = 0;//키보드 내려가면 count 초기화
        
        [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             _tttt.alpha = 1;
                             _kikiLb.alpha = 0;
                         } completion:^(BOOL finished) {}];
    }

    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
