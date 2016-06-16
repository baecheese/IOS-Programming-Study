//
//  TabBarViewController.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "TabBarViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "DataCenter.h"

@interface TabBarViewController () <UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation TabBarViewController


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSLog(@"----------TabBarViewController11111111");
    
    NSArray *viewControllers = self.tabBarController.viewControllers;
    OneViewController *vc1 = viewControllers.firstObject;
    TwoViewController *vc2 = [viewControllers objectAtIndex:1];
    DataCenter *data = [[DataCenter alloc]init];
    [data setTextData:vc1.oneLabel.text];
    vc2.self.twoLabel.text = vc1.oneLabel.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"12323");
    
    /*
     CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height);
     UIView *v = [[UIView alloc] initWithFrame:frame];
     [v setBackgroundColor:[UIColor greenColor]];
     [v setAlpha:0.5];
     [[self tabBar] addSubview:v];
     
     //set the tab bar title appearance for normal state
     [[UITabBarItem appearance]
     setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor],
     UITextAttributeFont:[UIFont boldSystemFontOfSize:16.0f]}
     forState:UIControlStateNormal];
     
     //set the tab bar title appearance for selected state
     [[UITabBarItem appearance]
     setTitleTextAttributes:@{ UITextAttributeTextColor : [UIColor blueColor],
     UITextAttributeFont:[UIFont boldSystemFontOfSize:16.0f]}
     forState:UIControlStateHighlighted];
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end