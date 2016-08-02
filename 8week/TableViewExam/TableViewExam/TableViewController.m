//
//  TableViewController.m
//  TableViewExam
//
//  Created by 배지영 on 2016. 6. 15..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray * data;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array1 = @[@"School", @"Camp"];
    NSArray *array2 = @[@"한국날씨", @"세계날씨"];
    self.data = @[array1, array2];
    
    NSLog(@"%d",[self.data count]);
    
    self.navigationItem.title = @"테이블뷰 연습";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Table view data source

/* Section */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

/* Row - section 내의 Array Object 갯수 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.data objectAtIndex:section] count];
}

/* Row(cell) 내의 데이터 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [self sectionOneSetting:tableView cellForRowAtIndexPath:indexPath];
        return cell;
    }
    else {
       UITableViewCell *cell = [self sectionTwoSetting:tableView cellForRowAtIndexPath:indexPath];
        return cell;
    }
    
}

/* 첫 번째 Cell 데이터 세팅 */
-(UITableViewCell *) sectionOneSetting:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* 스토리보드에서 생성했을 때 -Identifier꼭 연결하기 */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
    
    /*섹션에 해당하는 로우 데이터 세팅 -> 텍스트 & 컬러*/
    NSArray *section = [self.data objectAtIndex:indexPath.section];
    NSString *str = [section objectAtIndex:indexPath.row];
    [cell.textLabel setText:str];
    /*     FFFF99     */
    [cell setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:153/255.0f alpha:1.0f]];
    
    /* 악세사리 설정 */
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    /* row 높이 설정 */
    self.tableView.rowHeight = 50;
    
    cell.imageView.image = [UIImage imageNamed:@"sign-check-icon"];
    
    return cell;
}

/* 두 번째 Cell 데이터 세팅 */
-(UITableViewCell *) sectionTwoSetting:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* 스토리보드에서 생성했을 때 -Identifier꼭 연결하기 */
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    
    /*섹션에 해당하는 로우 데이터 세팅 -> 텍스트 & 컬러*/
    NSArray *section = [self.data objectAtIndex:indexPath.section];
    NSString *str = [section objectAtIndex:indexPath.row];
    [cell.textLabel setText:str];
    [cell setBackgroundColor:[UIColor grayColor]];
    
    /* CCFFCC */
    [cell setBackgroundColor:[UIColor colorWithRed:2040/255.0f green:255/255.0f blue:204/255.0f alpha:1.0f]];
    
    /* 악세사리 설정 */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    /* row 높이 설정 */
    self.tableView.rowHeight = 100;
    
    return cell;
}

/* 클릭한 셀 인덱스 표시 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 외부 프로토콜에 넣음 (다음 페이지에서 section별 row에 해당하는 index 접근 시, 필요)
    _selectCellIndex = indexPath.row;
    NSLog(@"select : %ld - %ld", (long)indexPath.section, (long)indexPath.row);
    //선택 해제 애니메이션
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - segue

/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"FastCampus"]) {
        
        // 각각의 세션 뒤에 row값 ----  나중에 데이터 센터에서 데이터 가져올 때는 이걸로 판별하면될 듯
        // 스쿨 - 3개 / 캠프 - 3개
        
        SecondTableViewController *secondTableView = [segue destinationViewController];
        [secondTableView setPreViewRow:@"School"];
    }
    
    if ([[segue identifier]isEqualToString:@"Weather"]) {
        SecondTableViewController *secondTableView = [segue destinationViewController];
        [secondTableView setPreViewRow:@""];
    }
}

 */


@end
