//
//  JoinViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "JoinViewController.h"

@interface JoinViewController () <UITextFieldDelegate, UINavigationControllerDelegate>

@end

@implementation JoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.joinIDTF.delegate = self;
    self.joinIDTF.tag = 1;
    
    self.joinPWTF.delegate = self;
    self.joinPWTF.tag = 2;
    
    self.joinRePWTF.delegate = self;
    self.joinRePWTF.tag = 3;
}

NSInteger count_Join = 0;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    count_Join++;
    
    __weak JoinViewController *wJself = self;
    
    const CGFloat joinW = self.joinView.frame.size.width;
    const CGFloat joinH = self.joinView.frame.size.height;
    
    //처음 불렸을 때만 애니메이션
    if (count_Join == 1)
    {
        [UIView animateWithDuration:4
                         animations:^
                        {
            
                            self.jockingJoinLb.alpha = 1;
                            self.joinTitle.alpha = 0;
            
                            [wJself.joinView setTransform:CGAffineTransformMakeRotation(M_PI)];
                        }
                         completion:nil];

    }
    
    NSLog(@"count : %ld",count_Join);
    
    
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    __weak JoinViewController *wJself = self;
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.joinView.frame.origin.x,self.joinView.frame.origin.y - self.joinView.frame.size.width * 0.25);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.6, 0.6);
    CGAffineTransform transform =  CGAffineTransformConcat(translate, scale);
    
    
    if (textField.tag == 1)
    {
        [_joinPWTF becomeFirstResponder];
    }
    if (textField.tag == 2)
    {
        [_joinRePWTF becomeFirstResponder];
    }
    if (textField.tag == 3)
    {
        [_joinRePWTF resignFirstResponder];
        count_Join = 0;
        NSLog(@"count : %ld",count_Join);
        
        
        [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveLinear
                         animations:^
                        {
                            self.jockingJoinLb.alpha = 0;
                            self.joinTitle.alpha = 1;
                            
                            wJself.joinView.transform = transform;
                            
                            [UIView commitAnimations];
                            
                            
                        }
                         completion:nil];
    }
    
    return YES;
}

- (IBAction)joinBtnAction:(UIButton *)sender {
    
}


-(BOOL)isCheckLoginWithID:(NSString *)userID userPW:(NSString *)userPW
{
    return NO;
}


// segue congtrol
// 세그로 이동 전 이동을 허용할 것인가를 확인
// 로그인 화면으로 이동 시, 로그인 여부 확인
// 회원가입 화면으로 이동 시, 바로 이동
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"JOIN_TO_MAIN"])
    {
        //로그인 가능 여부
        if ([self isCheckLoginWithID:self.idTf.text userPW:self.pwTf.text])
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"JOIN_TO_MAIN"])
    {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
