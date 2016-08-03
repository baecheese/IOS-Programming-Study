//
//  ViewController.m
//  AlertExample
//
//  Created by 배지영 on 2016. 6. 10..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)clickAlertBtn:(UIButton *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"경고" message:@"어떤 액션을 취하시겠습니까?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok");
    }];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"파괴");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"취소");
    }];
    
    [alert addAction:okButton];
    [alert addAction:destructiveAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}


// ActionSheet
- (IBAction)clikActionSheetBtn:(UIButton *)sender
{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"What do you want to do with the file?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Delete it"
                                                    otherButtonTitles:@"Copy", @"Move", @"Duplicate", nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"The %@ button was tapped.", [actionSheet buttonTitleAtIndex:buttonIndex]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
