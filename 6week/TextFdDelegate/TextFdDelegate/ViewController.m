//
//  ViewController.m
//  TextFdDelegate
//
//  Created by 배지영 on 2016. 6. 3..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTextField.delegate = self;

}

#pragma mark - UITextFieldDelegate Methods

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"사용자가 작업을 시작했다는 군?");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textField : 사용자가 나 Return키 눌렀어.. 어떻할까?");
    
    NSLog(@"나: 어... 한글자라도 썼으면 키보드 내려줘.. 아님 안되..");
    
    if (textField.text.length > 0)
    {
        [textField endEditing:YES];
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
