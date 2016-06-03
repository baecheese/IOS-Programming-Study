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

@end

@implementation ViewController

- (IBAction)buttonCilk:(UIButton *)sender
{
    NSLog(@"-----------viewController Action ----------");
    [[DataCenter sharedInstance] setName:self.nameTf.text];
    [[DataCenter sharedInstance] printData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[DataCenter sharedInstance] printData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
