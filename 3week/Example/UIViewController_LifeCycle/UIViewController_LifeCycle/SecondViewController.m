//
//  SecondViewController.m
//  Test0517
//
//  Created by 배지영 on 2016. 5. 17..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void)loadView
{
    [super loadView];
    NSLog(@"SecondViewController loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SecondViewController viewDidLoad");
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"SecondViewController viewWillAppear");
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"SecondViewController viewWillLayoutSubviews");
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"SecondViewController viewDidLayoutSubviews");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"SecondViewController viewDidAppear");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"SecondViewController viewWillDisappear");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"SecondViewController viewDidDisappear");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc
{
    NSLog(@"SecondViewController dealloc");
}



@end
