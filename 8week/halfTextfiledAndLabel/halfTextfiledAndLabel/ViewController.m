//
//  ViewController.m
//  halfTextfiledAndLabel
//
//  Created by 배지영 on 2016. 6. 14..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@property (nonatomic) NSString *changeText;
@property (nonatomic) NSInteger count;
@property (nonatomic,weak) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (IBAction)clik:(id)sender
{
    
    self.count++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.textView.delegate = self;
    
    //[self addObserver:self forKeyPath:@"count" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [self addObserver:self forKeyPath:@"textView" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
}

//addObserver가 감시하는 객체가 변경이 되면 호출이 된다
// change - 어떤 것이 바뀐 것인지, 어떤 것이 예전값인지 딕셔너리로 들어옴.
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSArray *newVlaue = [change objectForKey:NSKeyValueChangeNewKey];
    
    [self.countLabel setText:[NSString stringWithFormat:@"%@", newVlaue]];
    
    NSLog(@"");
    
    NSLog(@"kind: %@ , new : %@", kindValue, newVlaue);
    
}

-(void)textViewDidChange:(UITextView *)textView{
    [self.Lb setText:[NSString stringWithFormat:@"%@", self.textView.text]];
    
    
    
    
    NSLog(@"123");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
