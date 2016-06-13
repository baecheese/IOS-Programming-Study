//
//  ViewController.m
//  TextfieldAndLabel
//
//  Created by 배지영 on 2016. 6. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 스토리보드에서 연결함
    //_textField.delegate = self;
    
    [self makePinchInGestureRecognizer];
    [_label2 setTextAlignment:NSTextAlignmentCenter];
    
}


/************ button action **************/

/* 버튼 */
- (IBAction)clikBtn:(UIButton *)sender
{
    _label.text = _textField.text;
    NSLog(@"clikBtn");
    
    //resignFirstResponder보다 textField에 직접 명령
    [_textField endEditing:YES];


    
}
- (IBAction)nextBtnAction:(UIButton *)sender
{
    //[self performSegueWithIdentifier:@"Next" sender:sender];
    NSLog(@"nextBtn");
}

/************ textField **************/

/* return키 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return");
    [textField endEditing:YES];
    return YES;
}


/************ UITapGestureRecognizer **************/


// gestureRecognizer시작
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == _pinch) {
        NSLog(@"");
    }
    
    return YES;
}


// tab
- (IBAction)tabGesture:(UITapGestureRecognizer *)sender
{
    [_textField endEditing:YES];
    _label2.text = @"Tab!";
}

// pinch
-(void) makePinchInGestureRecognizer
{
    _pinch =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(pinchFunction:)];
    [self.view addGestureRecognizer:_pinch];
    _pinch.delegate = self;
}

- (void)pinchFunction:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"pinch!");
    _label2.text = @"Pich";
}


/************ segue **************/

// 화면에 그려지기 전 호출
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"Next"]) {
        
        
        SecondViewController *secondViewController = [segue destinationViewController];
        
        // Label 이 화면에 그려지기 전에 값을 세팅해주는 건 X
        //[secondViewController.seceondLael2 setText: self.label.text];
        
        secondViewController.temp = self.label.text;
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
