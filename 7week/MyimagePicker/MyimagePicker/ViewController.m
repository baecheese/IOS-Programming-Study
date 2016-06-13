//
//  ViewController.m
//  MyimagePicker
//
//  Created by 배지영 on 2016. 6. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)tapAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"Image view touch처럼 보이는 UITapGestureRecognizer");
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
        [pickerController setDelegate:self];
        
        // picker를 통한 이미지 수정 허용
        pickerController.allowsEditing = YES;
        
        //picker를 모달로 보여준다.
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

#pragma mark - UIImagePicker Controller Delegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //picker를 모달로 내려준다.
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 라이브러리에서 선택한 이미지를 받음
    UIImage *pickedOriginalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // 수정할 이미지는 새로 키를 변경ㅋ
    UIImage *eiditedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // 처음에 만든 이미지뷰에 set
    //[self.imageView setImage:pickedOriginalImage];
    
    self.imageView.image = eiditedImage;
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
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
