//
//  VC1.m
//  TabbarControllerExam
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "VC1.h"

@interface VC1 ()

@end

@implementation VC1


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    NSLog(@"Initialize the first Tab");
    
    if (self) {
        //set the title for the tab
        self.title = @"First Tab";
        //set the image icon for the tab
        self.tabBarItem.image = [UIImage imageNamed:@"first.png"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"View is displayed for the first Tab");
    
    //just display some text so that we know what view we are in
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 100)];
    myLabel.text = @"First View Controller";
    myLabel.font = [UIFont boldSystemFontOfSize:24.0f];
    [self.view addSubview:myLabel];
    
    
    
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
