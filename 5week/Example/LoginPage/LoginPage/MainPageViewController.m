//
//  MainPageViewController.m
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 2..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()<UINavigationBarDelegate>

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 테이블뷰 만들기
    
    
}
- (IBAction)loginOutBtn:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
