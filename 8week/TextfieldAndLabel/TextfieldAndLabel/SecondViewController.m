//
//  SecondViewController.m
//  TextfieldAndLabel
//
//  Created by 배지영 on 2016. 6. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 네비게이션이 관할하는 컨트롤러를 가져온 것 */
    [self upLabelSetting];
    
    /* 첫번째 화면에서 세그 넘어오기 전에 setting해준 데이터 세팅 */
    _seceondLael2.text = self.temp;
    
}

/* 네비게이션 컨트롤러 객체 array 가져옴 */
-(void)upLabelSetting
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    ViewController *firstViewController = viewControllers.firstObject;
    _secondLabel.text = firstViewController.label.text;
}


- (IBAction)buttonClike:(UIButton *)sender
{
    if (sender == self.preBtn) {
        //뒤로
        [[self navigationController] popViewControllerAnimated:YES];
    }
    else
    {
        // 다음
        // 스토리보드에서 진행
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
