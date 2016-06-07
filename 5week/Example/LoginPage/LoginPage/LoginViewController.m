//
//  LoginViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "LoginViewController.h"
#import "UserRepository.h"
#import "User.h"

@interface LoginViewController () <UITextFieldDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (nonatomic, weak) NSMutableDictionary *userData;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.idTf.tag = 1;
    self.idTf.delegate = self;
    
    self.pwTf.tag = 2;
    self.pwTf.delegate = self;
    
    [self navigationBarSetColor];
    
}

/* 텍스트 필드 */

NSInteger count_login = 0;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    count_login++;
    
    if (count_login == 1)
    {
        // 위협 멘트 및 로그인 화면 애니메이션
        [self downAndUpAnimation];
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
        
        // 원상태로 돌리는 애니메이션
        [self restoreAinmation];
    }

    return YES;
}

/* 화면 이동 허용 */

// segue congtrol (스토리보드를 사용했기 때문에 세그 관련 설정이 있는 것)
// 코드로 했다면 해당 바로 isCheck~함수로 바로 보면 됨
// 세그로 이동 전 이동을 허용할 것인가를 확인
// 로그인 화면으로 이동 시, 로그인 여부 확인
// 회원가입 화면으로 이동 시, 바로 이동

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"LOGIN_TO_MAIN"])
    {
        //로그인 가능 여부
        if ([self isCheckLoginData:_idTf.text userPW:_pwTf.text])
        {
            NSLog(@"--로그인 가능 --");
            return YES;
        }
        else
        {
            NSLog(@"-- 없는 회원입니다. --");
            return NO;
        }
    }
    // 회원가입
    if ([identifier isEqualToString:@"LOGIN_TO_JOIN"])
    {
        return YES;
    }
    
    return NO;
}

/* 빈칸 & 데이터 체크 */
-(BOOL)isCheckLoginData:(NSString *)userID userPW:(NSString *)userPW
{
    if ((1 > userID.length) || (1 > userPW.length))
    {
        [self showDefaultStyleAlert:@"경고" message:@"아이디, 패스워드를 빠짐없이 작성해주세요." actionMessage:@"yes"];
        NSLog(@"아이디나 패스워드가 빈칸입니다.");
        return NO;
    }
    
    UserRepository *userRepo = [[UserRepository alloc]init];
    User *user = [userRepo findByUserId:userID];
    
    if (([user isNotEqualPassword:userPW]) || (user == nil))
    {
        [self showDefaultStyleAlert:@"경고" message:@"회원정보를 확인해주십시오." actionMessage:@"yes"];
        NSLog(@"패스워드가 일치하지 않거나 유저가 없습니다.");
        return NO;
    }
    
    NSLog(@"해당 로그인 아이디 : %@ 패스워드: %@", [user userID], [user userPW]);
    return YES;
}

/* (todo) -- 오토로그인 관련 세팅은 prepareForSegue 안에서
 세그를 이동한 다음에 어떤 행동을 해야하는지에 대해 (이미 가기로 결정 되어있을 때, 다음 객체가 생성되어있는 시점) -> 다음 객체에게 무언가를 전달
 ex 메인 페이지에 데이터를 보낼 것. 그리고 오토 로그인 설정을 yes로 바꿈

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"LOGIN_TO_MAIN"])
    {
        
    }
}
*/

/* navigationBar 색깔 변경 */

-(void)navigationBarSetColor
{
    //[self.navigationController setHidesBarsOnTap:YES];
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
}

/* alert창 띄우기 */

-(void)showDefaultStyleAlert:(NSString *)titleText message:(NSString *)messageText actionMessage:(NSString *)actionMessage
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleText message:messageText preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:actionMessage style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){}];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



/* 애니메이션 */

-(void)downAndUpAnimation
{
    const CGFloat loginW = self.loginView.frame.size.width;
    const CGFloat loginH = self.loginView.frame.size.height;
    
    __weak LoginViewController *wself = self;
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^
     {
         [wself.loginView setFrame:CGRectMake(0, 0, loginW, loginH)];
         _tttt.alpha = 0;
         _kikiLb.alpha = 1;
         
     } completion:^(BOOL finished) {}];
}

-(void)restoreAinmation
{
    [UIView animateWithDuration:3 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _tttt.alpha = 1;
                         _kikiLb.alpha = 0;
                     } completion:^(BOOL finished) {}];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
