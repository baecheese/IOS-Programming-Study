//
//  CustomMovePage.m
//  TextfieldAndLabel
//
//  Created by 배지영 on 2016. 6. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "CustomMovePage.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface CustomMovePage ()

@end

@implementation CustomMovePage


- (IBAction)clikButton:(UIButton *)sender
{
    NSLog(@"%@ 페이지로 이동",_wantMovePageNum.text);
    NSInteger index = [_wantMovePageNum.text integerValue] - 1;
    
    /* - 인덱스 번호로 이동 - */
    if (index < self.navigationController.viewControllers.count &&
        index >= 0)
    {
        [self.navigationController popToViewController:self.navigationController.viewControllers[index] animated:YES];
    }
    
    /* ---- 해당 뷰 컨트롤러로 바로 갈 수 있도록 함 =>
     해당 뷰 컨트롤러를 import해줘야 한다.
     이런 방법은 분기점이 여러개인 네비게이션 구조일 때에 특정 화면으로 이동할 때 사용 가능할 것 ---- */
    
    /*
    for (UIViewController *viewController in self.navigationController.viewControllers)
    {
        if ([viewController isKindOfClass:[SecondViewController class]]) {
            [self.navigationController popToViewController:viewController animated:YES];
            break;
        }
    }
     
     */
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
