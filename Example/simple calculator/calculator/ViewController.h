//
//  ViewController.h
//  calculator
//
//  Created by 배지영 on 2016. 5. 4..
//  Copyright © 2016년 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    NSUInteger resultNum;
    NSString *operatorBuffer;
    NSString *displayText;
}

@property (nonatomic, weak) IBOutlet UITextField *displayTextField;

@end



