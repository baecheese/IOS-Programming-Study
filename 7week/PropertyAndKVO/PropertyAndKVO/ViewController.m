//
//  ViewController.m
//  PropertyAndKVO
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)setCount:(NSInteger)count
{
    // self.count -> setter라 외부에서 값 변경할 때 하는 것
    // _count -> 내부에서 값 변경
    _count = count;
    NSLog(@"Set Count : %ld", _count);
    
    [self.countLabel setText:[NSString stringWithFormat:@"%ld", _count]];
}

- (IBAction)clikBtn:(id)sender
{
    // 변화
    self.count++;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
