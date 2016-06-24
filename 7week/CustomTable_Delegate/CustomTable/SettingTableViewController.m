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

#pragma mark - setting TableView Cell delegate

// 변환된 스위치 상태 저장
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
    if (indexPath.section == 0)
    {
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
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     UITableViewCell *senderCell = (UITableViewCell *)sender;
     NSLog(@"segue wil action: %@", senderCell.textLabel.text);
     
     /* 2nd 뎁스로 들어갈때 보여줄 정보를 어떤 것인지 처리해줄 메소드 */
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



@end
