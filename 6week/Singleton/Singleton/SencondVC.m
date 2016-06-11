//
//  SencondVC.m
//  Singleton
//
//  Created by 배지영 on 2016. 6. 2..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SencondVC.h"
#import "DataCenter.h"

@interface SencondVC ()

@property (weak, nonatomic) DataCenter *data;

@end

@implementation SencondVC


- (IBAction)btnClik:(UIButton *)sender {

    NSLog(@"----------SencondVC-----------");
    [_data setAge:self.ageTf.text.integerValue];
    [_data printData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [DataCenter sharedInstance];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
