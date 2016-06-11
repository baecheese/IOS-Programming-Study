//
//  ViewController.m
//  Singleton
//
//  Created by 배지영 on 2016. 6. 2..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()

@property (weak, nonatomic) DataCenter *data;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"--------viewDidLoad-----------");
    _data = [DataCenter sharedInstance];
}




- (IBAction)buttonCilk:(UIButton *)sender
{
    NSLog(@"-----------viewController Action ----------");
    [_data setName:self.nameTf.text];
    [_data printData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"--------viewWillAppear-----------");
    [_data printData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
