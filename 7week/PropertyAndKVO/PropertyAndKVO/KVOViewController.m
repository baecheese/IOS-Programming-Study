//
//  KVOViewController.m
//  PropertyAndKVO
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "KVOViewController.h"

@interface KVOViewController ()

@property (nonatomic) NSInteger count;
@property (nonatomic,weak) IBOutlet UILabel *countLabel;

@end

@implementation KVOViewController



- (IBAction)clikBtn:(id)sender
{
    self.count++;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 내 객체(self)의 count 라는 값을 지켜보고 싶다는 뜻
    //NSKeyValueObservingOptionNew 바뀐 것 / NSKeyValueChangeOldKey 이전 것
    [self addObserver:self forKeyPath:@"count" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

//addObserver가 감시하는 객체가 변경이 되면 호출이 된다
// change - 어떤 것이 바뀐 것인지, 어떤 것이 예전값인지 딕셔너리로 들어옴.
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //NSLog(@"%@", change);
    
    // 컬렉션에는 참조형 객체만 들어갈 수 있다.
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSArray *newVlaue = [change objectForKey:NSKeyValueChangeNewKey];
    
    [self.countLabel setText:[NSString stringWithFormat:@"%@", newVlaue]];
    NSLog(@"kind: %@ , new : %@", kindValue, newVlaue);
    
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
