//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) DataCenter *datas;
@property (strong, nonatomic) UITableView *tableView;
@property (weak, nonatomic) NSArray *sortedDataKeys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableView];
    _datas = [DataCenter defaultData];
    
}

#pragma mark - UITableViewDataSource

/* 테이블 뷰 */

/* 생성 */
- (void) creatTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

/* section 갯수 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    /* 섹션 타이틀 갯수 만큼*/
    return [[_datas sectionTitles] count];
}

/* row 갯수 - key별 value갯수 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // NSLog(@"section :::::: %zd",section);
    
    // key 알파벳순 정렬
    NSArray *unsortedDataKeys = [_datas sectionTitles];
    _sortedDataKeys =
    [unsortedDataKeys sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"Unsorted Array : %@",unsortedDataKeys);
    NSLog(@"Sorted Array : %@",_sortedDataKeys);
    
    // value count 갯수 == row 갯수
    NSInteger rowNum = 0;
    NSString *animalsKey = [_sortedDataKeys objectAtIndex:section];
    
    rowNum = [[[_datas animals] valueForKey:animalsKey]count];
    
    return rowNum;
}

/* cell 객체 + 데이터 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *tableViewCellID = @"BasicCell";
    
    //만들어진 셀을 가져오는 상황
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID];
    NSLog(@"index: section - %ld, row - %ld", indexPath.section, indexPath.row);
    
    // 만약에 셀이 없으면 만들어서 가져와라
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellID];
        NSLog(@"Make cell for index: %ld - %ld", indexPath.section, indexPath.row);
    }
    
    /* 동물 key - value - image 세팅 */
    NSString *animalsKey = [_sortedDataKeys objectAtIndex:indexPath.section];
    NSArray *animalValueArray = [[_datas animals] valueForKey:animalsKey];
    NSString *animalVlaue = [animalValueArray objectAtIndex:indexPath.row];
    
    NSString *title = [NSString stringWithFormat:@"%@", animalVlaue];
    [cell.textLabel setText:title];
    cell.imageView.image = [UIImage imageNamed:[_datas imageNameWithAnimal:animalVlaue]];
    
    return cell;
}

/* indexbar */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _sortedDataKeys;
}
 

/* 해더 설정 */
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *keys = [_datas sectionTitles];
    NSString *key = [keys objectAtIndex:section];
    return key;
}


#pragma mark - UITableViewDelegate




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning!!!!!!!!!!!!!!!!!!!!!");
}

@end
