//
//  ViewController.m
//  MyimagePicker
//
//  Created by 배지영 on 2016. 6. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIView *imageView;

@end

@implementation ViewController

- (IBAction)tapAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"Image view touch");
    
    
    [self showActionSheet];
    
}

-(void)showActionSheet
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"라이브러리" message:@"사진을 어디서 가져올까요?" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *carmera = [UIAlertAction actionWithTitle:@"카메라" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        /* 이미지 피커 */
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        NSLog(@"카메라 선택");
    }];
    
    UIAlertAction *abum = [UIAlertAction actionWithTitle:@"앨범" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        /* 이미지 피커 */
        [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        NSLog(@"앨범 선택");
    }];
       
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"취소");
    }];
    
    [alert addAction:carmera];
    [alert addAction:abum];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"이건 뭐지");
    }];
}

/* 이미지 피커 관련 소스 함수 */
-(void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    /* 소스타입 사용 가능한 상황인지 ex 시뮬레이터는 카메라 안됨 */
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] == NO)
    {
        // 사용자에겐 allert 띄워주기
        // 난 로그를 볼 거다
        NSLog(@"이 소스는 못쓰낟");
    }
    else
    {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        [pickerController setSourceType:sourceType];
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    NSLog(@"actionSheetCancel");
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"willPresentActionSheet");
}
- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    NSLog(@"didPresentActionSheet");
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"willDismissWithButtonIndex");
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismissWithButtonIndex");
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
