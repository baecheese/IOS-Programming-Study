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

@interface JoinViewController () <UITextFieldDelegate, UINavigationControllerDelegate,UIAlertViewDelegate>

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
        
        //NSLog(@"count : %ld",count_Join);
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
            /* 유저 정보 저장 */
            [self userDataSave:self.joinIDTF.text userPW:self.joinPWTF.text];
            
            return YES;
        }
        else
        {
            NSLog(@"가입 불가");
            return NO;
        }
    }
    return NO;
}


// 빈칸, 비밀번호 일치, 이미 가입한 유저인지 체크
-(BOOL)isCheckUserData
{
    if ((1 > self.joinIDTF.text.length) || (1 > self.joinPWTF.text.length))
    {
        [self showDefaultStyleAlert:@"경고" message:@"패스워드가 너무 짧습니다." actionMessage:@"확인"];
        return NO;
    }
    else if ((self.joinPWTF.text != self.joinRePWTF.text))
    {
        [self showDefaultStyleAlert:@"경고" message:@"패스워드가 일치하지 않습니다." actionMessage:@"확인"];
        return NO;
    }
    else
    {
        UserRepository *userRepository = [[UserRepository alloc]init];
        User *nowUser = [userRepository findByUserId:self.joinIDTF.text];
        
        if (nowUser != nil)
        {
            NSLog(@"이미 가입한 유저입니다.");
            return NO;
        }
        
        return YES;
    }
}

/* 유저 정보 저장 */

- (void)userDataSave:(NSString *)userIDText userPW:(NSString *)userPWText
{
    UserRepository *userRepository = [[UserRepository alloc]init];
    [userRepository save:[[User alloc]initWithUser:userIDText userPW:userPWText]];
    NSLog(@"가입 완료: ID - %@, PW - %@", userIDText, userPWText);
}


/* alert */

-(void)showDefaultStyleAlert:(NSString *)titleText message:(NSString *)messageText actionMessage:(NSString *)actionMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleText message:messageText preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:actionMessage style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){}];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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


/* 애니메이션 관련 텍스트필드 */

//NSInteger count_Join = 0;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //count_Join++;
    
    /* 처음 불렸을 때만 애니메이션
     if (count_Join == 1)
     {
     //[self rotationAnimation];
     }
     NSLog(@"count : %ld",count_Join);
     
     */
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
