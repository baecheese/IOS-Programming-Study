//
//  SecoundViewController.m
//  PropertyAndKVO
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecoundViewController.h"
#import "ViewController.h"

@interface SecoundViewController ()

@end

@implementation SecoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 네비게이션이 관할하는 컨트롤러들 가져올 수 있음*/
//    NSArray *viewControllers = self.navigationController.viewControllers;
//    
//    ViewController *firstViewController = viewControllers.firstObject;
//    
//    firstViewController.count = 5;
    
}
- (IBAction)btnClike:(UIButton *)sender
{
    /* 네비게이션 첫 번째 viewController 가져와서 count 변수 접근 & 변경 */
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    ViewController *firstViewController = viewControllers.firstObject;
    
    firstViewController.count++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controllesr using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
