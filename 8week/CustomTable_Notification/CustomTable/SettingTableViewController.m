//
//  SettingTableViewController.m
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"

@interface SettingTableViewController () <SettingTableViewCellDelegate>

@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataCenter = [DataCenter defaultData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(settingTableViewCellSwitchValueChanged:) name:@"settingTableViewCellSwitch" object:nil];
}

// NSNotification post 받는 곳
-(void)settingTableViewCellSwitchValueChanged:(NSNotification *)sender
{
    
}

// NSNotification 옵저빙하던 것 화면을 떠났을 때 가장 먼저 불리는 함수
-(void)dealloc
{
    NSLog(@"dealloc");
    // 나 자신의 옵저빙을 빼는 것
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataCenter numberOfSectionsForSettingTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataCenter numberOfRowForSectionInSettingTable:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *dataArray = [self.dataCenter settingTableDataForSection:indexPath.section];
    NSString *text = [dataArray objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0)
    {
        /* SettingTableViewCell이 UITableViewCell을 상속받았고
         내가 원하는 cutom한 특성을 가지고 있다. */
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        
        if (cell == nil)
        {
            // override한 initWithStyle (SettingTableViewCell)
            cell = [[SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SettingCell"];
            
            cell.delegate = self;
            
            // 위에 그룹 셀은 선택 표시가 안보이게 하는 것
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell.textLabel setText:text];
        
        // 셀을 불러올 때 세팅 상태를 불러옴
        BOOL isFunctionOn = [self.dataCenter isOnForSetting:indexPath.row];
        [cell.settingSwitch setOn:isFunctionOn];
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subTitleCell" forIndexPath:indexPath];
        
        [cell.textLabel setText:text];
        return cell;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataCenter settingTableHeaderTitleForSection:section];
}

#pragma mark setting TableView Cell delegate

- (void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn
{
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
    // userDefault로 저장
    [self.dataCenter setSeting:cellIndex.row isOn:isOn];
    
    NSLog(@"Cell Index: %ld - %ld, isOn: %d", cellIndex.section, cellIndex.row, isOn);
}

#pragma mark - UITableView delegate

// 셀이 선택 됬을 때 불리는 함수
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row Selected : %ld - %ld", indexPath.section, indexPath.row);
    
    // 0번째 섹션은 튕겨내게
    if (indexPath.section == 0) {
        return;
    }
    
    //선택 해제 애니메이션
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    
    // 상세 날씨 다음페이지 세그 연결
    [self performSegueWithIdentifier:@"ShowDetailWeather" sender:sender];
    
}



 #pragma mark - Navigation

// 세그를 통해 화면을 움직이기 전에 사용할 메소드

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     UITableViewCell *senderCell = (UITableViewCell *)sender;
     
     NSLog(@"segue wil action: %@", senderCell.textLabel.text);
     
     //2nd 뎁스로 들어갈때 보여줄 정보를 어떤 것인지 처리해줄 메스도 ***************
     WeatherTableViewController *tableViewController = segue.destinationViewController;
     if ([senderCell.textLabel.text isEqualToString:@"한국날씨"])
     {
         tableViewController.weatherType = WeatherTypeKorea;
     }
     else
     {
         tableViewController.weatherType = WeatherTypeWorld;
     }
     
     
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


@end
