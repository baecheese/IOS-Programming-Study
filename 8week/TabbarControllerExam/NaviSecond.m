//
//  NaviSecond.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "NaviSecond.h"
#import "OneViewController.h"

@interface NaviSecond ()

@end

@implementation NaviSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingText];
}

-(void)settingText
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    OneViewController *vc1 = viewControllers.firstObject;
    self.naviLabel.text = vc1.oneLabel.text;
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
