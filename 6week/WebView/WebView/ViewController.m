//
//  ViewController.m
//  WebView
//
//  Created by 배지영 on 2016. 5. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate,UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_backImg setImage:[UIImage imageNamed:@"image"]];
    [_backImg setContentMode:UIViewContentModeScaleAspectFill];
    
    self.myWeb.delegate = self;
    self.urlTf.delegate = self;
    
}


NSInteger webView_Count = 0;

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    webView_Count++;
    
    // 최초 실행 시, 웹뷰 애니메이션 효과
    if (webView_Count == 1)
    {
        [self animationWebView];
    }
    
    [textField resignFirstResponder];
    
    // 텍스트 필드 URL 웹뷰로 로드
    [self loadTextFieldURLToWebView];
    
    return YES;
}

// Go버튼 액션 관련
- (IBAction)btnClik:(UIButton *)sender
{
    webView_Count++;
    
    // 버튼 클릭시 키보드 내려감
    [_urlTf resignFirstResponder];
    
    // 최초 실행시 알파 조정
    if (webView_Count == 1)
    {
        [self animationWebView];
    }
    
    if(sender == _goBtn)
    {
        // 텍스트 필드 URL 웹뷰로 로드
        [self loadTextFieldURLToWebView];
    }

        [_urlTf resignFirstResponder];
    
}


// UIBarButton 활성화
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_myWeb.canGoBack == YES) {
        _backBtn.enabled = YES;
    }
    else
    {
        _backBtn.enabled = NO;
    }
    if (_myWeb.canGoForward == YES)
    {
        _frontBtn.enabled = YES;
    }
    else
    {
        _frontBtn.enabled = NO;
    }
    
}

/// UIBarButtonItem은 액션 받는 함수가 1개씩이다.
//뒤로 가기 버튼
- (IBAction)backBarButton:(UIBarButtonItem *)sender
{
    [_myWeb goBack];
    NSLog(@"뒤로가기");
}

//앞으로 가기 버튼
- (IBAction)forwardBarButton:(UIBarButtonItem*)sender
{
    [_myWeb goForward];
    NSLog(@"앞으로가기");
}

// 새로고침
- (IBAction)reloadBarButton:(UIBarButtonItem *)sender {
    [_myWeb reload];
    NSLog(@"새로고침");
}


// 웹뷰 알파값 조정 애니메이션
-(void)animationWebView
{
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseIn
                              animations:^
                              {
                                  self.myWeb.alpha = 1;
                              }
                              completion:nil];
}

// 텍스트필드 url 웹뷰로 실행
-(void)loadTextFieldURLToWebView
{
    NSURL *tfURL = [NSURL URLWithString:_urlTf.text];
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:tfURL];
    [_myWeb loadRequest:myURLReq];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
