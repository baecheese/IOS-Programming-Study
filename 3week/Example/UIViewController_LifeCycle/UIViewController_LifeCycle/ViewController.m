//
//  ViewController.m
//  Test0517
//
//  Created by 배지영 on 2016. 5. 17..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"
#import "MyTestClass.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView
{
    [super loadView];
    NSLog(@"ViewController loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewController viewDidLoad");
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"ViewController viewWillAppear");
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"ViewController viewWillLayoutSubviews");
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"ViewController viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"ViewController viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"ViewController viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"ViewController viewDidDisappear");
}

    
    /*
    MyTestClass *testObject = [[MyTestClass alloc]init];
    //viewDidLoad메소드가 끝나는 시점에 testObject가 메모리에서 해제
    
    NSLog(@"Break");
    
    NSLog(@"viewDidLoad wiil finish");
    
     */
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
