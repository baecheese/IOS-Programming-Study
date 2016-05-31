//
//  ViewController.h
//  WebView
//
//  Created by 배지영 on 2016. 5. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (weak, nonatomic) IBOutlet UIWebView *myWeb;
@property (weak, nonatomic) IBOutlet UITextField *urlTf;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *frontBtn;

@end

