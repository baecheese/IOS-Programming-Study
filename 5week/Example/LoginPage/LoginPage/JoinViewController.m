//
//  JoinViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "JoinViewController.h"
#import "User.h"
#import "UserRepository.h"

@interface JoinViewController () <UITextFieldDelegate, UINavigationControllerDelegate>

@end

@implementation JoinViewController

- (void)viewDidLoad
{ 
    [super viewDidLoad];
    
    self.joinIDTF.delegate = self;
    self.joinIDTF.tag = 1;
    
    self.joinPWTF.delegate = self;
    self.joinPWTF.tag = 2;
    
    self.joinRePWTF.delegate = self;
    self.joinRePWTF.tag = 3;
}

/* 텍스트 필드 */

NSInteger count_Join = 0;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    count_Join++;
    
    //처음 불렸을 때만 애니메이션
    if (count_Join == 1)
    {
        //[self rotationAnimation];
    }
    NSLog(@"count : %ld",count_Join);
    
    return YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
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
        
        //[self smallViewAnimation];
    }
    
    return YES;
}


/* 버튼 액션 */

- (IBAction)joinBtnAction:(UIButton *)sender
{
    
}


/* 화면 이동 허용 */

// segue congtrol
// 세그로 이동 전 이동을 허용할 것인가를 확인
// 로그인 화면으로 이동 시, 로그인 여부 확인
// 회원가입 화면으로 이동 시, 바로 이동


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"JOIN_TO_MAIN"])
    {
        if (self.isCheckUserData)
        {
            /* 데이터 센터에 유저 정보 저장 */
            UserRepository *userRepository = [[UserRepository alloc]init];
            User *checkUser = [userRepository findByUserId:self.joinIDTF.text];
            
            if (checkUser != nil)
            {
                NSLog(@"이미 가입한 유저입니다.");
                return NO;
            }
            
            /* 유저 정보 저장 */
            [userRepository save:[[User alloc]initWithUser:self.joinIDTF.text userPW:self.joinPWTF.text]];
            NSLog(@"가입 완료: ID - %@, PW - %@", self.joinIDTF.text, self.joinPWTF.text);
            return YES;
        }
        else
        {
            NSLog(@"패스워드 일치 또는 빈칸이 없는지 확인해주십쇼.");
            return NO;
        }
    }
    return NO;
}


// 빈칸, 비밀번호 일치, 체크
-(BOOL)isCheckUserData
{
    if ((1 > self.joinIDTF.text.length) && (1 > self.joinPWTF.text.length))
    {
        return NO;
    }
    
    if ((1 < self.joinIDTF.text.length) && (1 < self.joinPWTF.text.length) && (_joinPWTF.text == _joinRePWTF.text))
    {
        return YES;
    }
    
    else
    {
        //(알럿창 띄우기)
        return NO;
    }
}



/* 
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"JOIN_TO_MAIN"])
    {
        
    }
}

*/

/* 애니메이션 */

-(void)rotationAnimation
{
    __weak JoinViewController *wJself = self;
    
    [UIView animateWithDuration:4
                     animations:^
     {
         
         self.jockingJoinLb.alpha = 1;
         self.joinTitle.alpha = 0;
         
         [wJself.joinView setTransform:CGAffineTransformMakeRotation(M_PI)];
     }
                     completion:nil];
    
    
}



-(void)smallViewAnimation
{
    __weak JoinViewController *wJself = self;
    CGAffineTransform translate = CGAffineTransformMakeTranslation(self.joinView.frame.origin.x,self.joinView.frame.origin.y - self.joinView.frame.size.width * 0.25);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.6, 0.6);
    CGAffineTransform transform =  CGAffineTransformConcat(translate, scale);
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
