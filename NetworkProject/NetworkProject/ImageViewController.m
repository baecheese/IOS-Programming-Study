//
//  ImageViewController.m
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ImageViewController.h"
#import "TableViewController.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

-(void)viewDidAppear:(BOOL)animated
{
    //전화면 imageView 가져오기
    TableViewController *tableVC = [self.navigationController.viewControllers firstObject];
    NSMutableArray *imageDatas = [tableVC imageDatas];
    NSInteger selectRowIndex = [tableVC selectRowIndex];
    self.imageView.image = [imageDatas objectAtIndex:selectRowIndex];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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
