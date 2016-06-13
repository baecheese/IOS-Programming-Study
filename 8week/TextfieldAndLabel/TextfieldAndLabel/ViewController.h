//
//  ViewController.h
//  TextfieldAndLabel
//
//  Created by 배지영 on 2016. 6. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondViewController;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong,nonnull) UIPinchGestureRecognizer *pinch;
@property (weak, nonatomic) IBOutlet UILabel *label2;

//@property (weak,nonatomic) SecondViewController *secondViewController;

@property (weak, nonatomic) UILabel *temp;

@end

