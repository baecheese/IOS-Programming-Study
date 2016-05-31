//
//  JoinViewController.h
//  LoginPage
//
//  Created by 배지영 on 2016. 5. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface JoinViewController : ViewController

@property (weak, nonatomic) IBOutlet UIView *joinView;
@property (weak, nonatomic) IBOutlet UILabel *joinTitle;

@property (weak, nonatomic) IBOutlet UITextField *joinIDTF;
@property (weak, nonatomic) IBOutlet UITextField *joinPWTF;
@property (weak, nonatomic) IBOutlet UITextField *joinRePWTF;

@property (weak, nonatomic) IBOutlet UILabel *jockingJoinLb;

@end
