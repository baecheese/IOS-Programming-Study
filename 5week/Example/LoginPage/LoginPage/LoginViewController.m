//
//  LoginViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"

@interface LoginViewController () <UITextFieldDelegate, UINavigationControllerDelegate>

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

// segue congtrol
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

//빈칸 & 데이터 체크
-(BOOL)isCheckLoginData:(NSString *)userID userPW:(NSString *)userPW
{
    DataCenter *dataCenter = [DataCenter sharedInstance];
    NSMutableDictionary *user = [dataCenter findByUserId:userID];
    
    if ((1 < userID.length) && (1 < userPW.length))
    {
        // NSString *pw = [user valueForKey:@"@PW"];
        NSString *pw = [user valueForKey:@"PW"];
        if (userPW == pw) {
                return YES;
        }
        return NO;
    }
    
    return NO;
}

/*

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"LOGIN_TO_MAIN"])
    {
        
    }
}

/* navigationBar 색깔 변경 */

-(void)navigationBarSetColor
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
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