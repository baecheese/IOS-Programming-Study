//
//  ViewController.m
//  UITest
//
//  Created by 배지영 on 2016. 5. 24..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //View 실습
    
    const CGFloat VIEW_HALF_WIDTH = self.view.frame.size.width/2;
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
    [self.view addSubview:leftView];
    [leftView setBackgroundColor:[UIColor redColor]];
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(VIEW_HALF_WIDTH, 0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
    [self.view addSubview:rightView];
    [rightView setBackgroundColor:[UIColor blueColor]];
    
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, VIEW_HALF_WIDTH, self.view.frame.size.width/2)];
    [leftView addSubview:topView];
    [topView setBackgroundColor:[UIColor blueColor]];
    
    UIView *bottonView = [[UIView alloc]initWithFrame:CGRectMake(0, (rightView.frame.size.height-VIEW_HALF_WIDTH), VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
    [rightView addSubview:bottonView];
    [bottonView setBackgroundColor:[UIColor redColor]];

    
    UIView *fristView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-40)];
    [self.view addSubview:fristView];
    [fristView setBackgroundColor:[UIColor brownColor]];
    
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, fristView.frame.size.width-40, fristView.frame.size.height-40)];
    [fristView addSubview:secondView];
    [secondView setBackgroundColor:[UIColor yellowColor]];
    
    
    // Label 및 View 실습
    
    CGFloat offsetWitdth = self.view.frame.size.width- 40;
    
    UILabel *examLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, offsetWitdth, 20)];
    [self.view addSubview:examLable];
    examLable.text = @"예제화면 입니다.";
    //[examLable setBackgroundColor:[UIColor redColor]];
    
    UILabel *beatifulLb = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, offsetWitdth, 20)];
    [self.view addSubview:beatifulLb];
    [beatifulLb setTextAlignment:NSTextAlignmentRight];
    beatifulLb.text = @"예쁜 레이블 입니다.";
    [beatifulLb setTextColor:[UIColor redColor]];
    //[beatifulLb setBackgroundColor:[UIColor brownColor]];
    
    UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(20, 80, 300, 150)];
    [self.view addSubview:blackView];
    [blackView setBackgroundColor:[UIColor blackColor]];
    
    UILabel *textLb = [[UILabel alloc]initWithFrame:CGRectMake(120, blackView.frame.size.height-30, 200, 30)];
    [blackView addSubview:textLb];
    [textLb setTextColor:[UIColor whiteColor]];
    textLb.text = @"View위에 레이블 입니다.";
    
    UILabel *centerLb = [[UILabel alloc]initWithFrame:CGRectMake(20, 250, offsetWitdth, 30)];
    [self.view addSubview:centerLb];
    centerLb.text = @"중앙에 있는 레이블 입니다.";
    [centerLb setTextAlignment:NSTextAlignmentCenter];
    //[centerLb setBackgroundColor:[UIColor yellowColor]];
    
    UILabel *centerLb2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, offsetWitdth, 30)];
    [self.view addSubview:centerLb2];
    centerLb2.text = @"폰트는 20입니다.";
    [centerLb2 setFont:[UIFont systemFontOfSize:20]];
    [centerLb2 setTextAlignment:NSTextAlignmentCenter];
    [centerLb2 setBackgroundColor:[UIColor yellowColor]];


    // 이미지뷰 실습
    
    UIImageView *catJpg = [[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 100, 300)];
    [catJpg setImage:[UIImage imageNamed:@"maxresdefault.jpg"]];
    [catJpg setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:catJpg];
    
    UIImageView *catPng = [[UIImageView alloc]initWithFrame:CGRectMake(100, 400, 200, 300)];
    [catPng setImage:[UIImage imageNamed:@"Cat-PNG"]];
    [catPng setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:catPng];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
