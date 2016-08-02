//
//  ViewController.m
//  TableViewUseCode
//
//  Created by 배지영 on 2016. 6. 15..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) NSArray * data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 테이블뷰 생성 */
    UITableView *tb = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60) style:UITableViewStyleGrouped];
    
    tb.delegate = self;
    tb.dataSource = self;
    [self.view addSubview:tb];
    
    /* 데이터 세팅 */
    NSArray *array1 = @[@"School", @"Camp"];
    NSArray *array2 = @[@"한국날씨", @"세계날씨"];
    
    self.data = @[array1, array2];
    
}


#pragma mark - Table view data source

// 섹션
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

// 로우
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.data objectAtIndex:section]count];
}

// section 하나 안에 row(cell) 갯수만큼 도는 것이다
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 셀이 있을 때 만들어주고
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    // 셀이 없으면 생성해줘라
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        NSLog(@"Make cell for index: %ld - %ld", indexPath.section, indexPath.row);
    }
    
    // 데이터 에서 row 순서대로 데이터에 접근
    // row index 0 = data index 0
    NSArray *sectionGroup = [self.data objectAtIndex:indexPath.section];

    NSString *str = [sectionGroup objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:str];
    
    /* cell color 설정 */
    if (indexPath.section == 0) {
        [cell setBackgroundColor:[UIColor orangeColor]];
    }
    else
    {
        [cell setBackgroundColor:[UIColor lightGrayColor]];
    }
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
