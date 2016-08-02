//
//  ThreeTableViewController.m
//  TableViewExam
//
//  Created by 배지영 on 2016. 6. 15..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ThreeTableViewController.h"
#import "TableViewController.h"

@interface ThreeTableViewController ()

@property (nonatomic, strong) NSArray *weatherList;

@property (nonatomic) TableViewController *VC;

@end

@implementation ThreeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *koreaAreaNames = @[@"고양",@"과천",@"광명",@"구리",@"군포",@"남양주",@"동두천",@"부천",@"성남",@"수원",@"시흥"];
    NSArray *worldNames = @[@"가나",
                           @"가봉",
                           @"가이아나",
                           @"감비아",
                           @"과테말라",
                           @"그레나다"];
    self.weatherList = @[koreaAreaNames, worldNames];
    
    self.VC = self.navigationController.viewControllers.firstObject;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 진입 섹션 내 object갯수만큼
    return [[self.weatherList objectAtIndex:self.VC.selectCellIndex] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    // 이전 메뉴 인덱스와 매칭되는 dataArray 가져오기
    NSInteger prePageRowIndex = self.VC.selectCellIndex;
    
    
    /* section별 row에 data 뿌려주기 */
    if (indexPath.section == 0) {
        // 한국 지역 별 array / name
        NSArray *koreaAreaNames = [self.weatherList objectAtIndex:prePageRowIndex];
        NSString *koreaAreaName = [koreaAreaNames objectAtIndex:indexPath.row];
        [cell.textLabel setText:koreaAreaName];
        return cell;
    }
    else {
        // 세계 지역 별 array / name
        NSArray *worldNames = [self.weatherList objectAtIndex:prePageRowIndex];
        NSString *worldName = [worldNames objectAtIndex:indexPath.row];
        [cell.textLabel setText:worldName];
        return cell;
    }
    
    

}

/* 셀 선택시 불림 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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

@end
