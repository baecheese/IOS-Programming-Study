//
//  TwoViewController.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "TwoViewController.h"
#import "OneViewController.h"

@interface TwoViewController () <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBarItem *twoBarBtn;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TwoViewController");
}


-(void)viewWillAppear:(BOOL)animated
{
    NSArray *VCs = self.tabBarController.viewControllers;
    UINavigationController *navi = VCs.firstObject;
    OneViewController *oneVC = navi.viewControllers.firstObject;
    self.twoLabel.text = oneVC.oneLabel.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
