//
//  ThreeViewController.m
//  TextfieldAndLabel
//
//  Created by 배지영 on 2016. 6. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController


- (IBAction)preScreenMoveButton:(UIButton *)sender
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)fristScreenMoveButton:(UIButton*)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
