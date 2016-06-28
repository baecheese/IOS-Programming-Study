//
//  ImageViewController.m
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ImageViewController.h"
#import "TableViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImageManager.h>

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

-(void)viewDidAppear:(BOOL)animated
{
    /* 전화면 imageView 가져오기 */
    TableViewController *tableVC = [self.navigationController.viewControllers firstObject];
    NSInteger selectRowIndex = [tableVC selectRowIndex];
    
    // (네트워크 미사용) 이미지 array
    // NSMutableArray *imageDatas = [tableVC imageDatas];
    //self.imageView.image = [imageDatas objectAtIndex:selectRowIndex];
    
    /* SDWebImage 사용 */
    NSMutableArray *imageURLArray = [tableVC imageURLArray];
    NSURL *imageURL = [imageURLArray objectAtIndex:selectRowIndex];
    [self.imageView sd_setImageWithURL:imageURL];
    
    /*
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:nil options: SDWebImageProgressiveDownload | SDWebImageCacheMemoryOnly];
     */
    
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
