//
//  EditingTableViewController.m
//  TableEditing
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "EditingTableViewController.h"
#import "DataCenter.h"


@interface EditingTableViewController ()

@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation EditingTableViewController

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataCenter dataForSection:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //Cell에 텍스트 레이블에 문자열 데이터를 설정
    NSMutableArray *data = [self.dataCenter dataForSection:indexPath.section];
    NSLog(@"%@", data);
    
    NSString *text = [data objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    
    // 위에 세 줄을 간추리면
    //cell.textLabel.text = [self.dataCenter dataForSection:indexPath.section][indexPath.row];
    
    return cell;
}


/* 인덱스에 대한 편집 허용 여부 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return NO;
    }
     */
    
    return YES;
}

/* 테이블뷰의 에디팅 스타일 */
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleInsert;
}


/* 테이블뷰 에디팅  */
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        /* 한 열의 데이터 소스 삭제  --> data를 다시 불러와야한다. -> 그런데, 삭제한 것이 dataCenter에 데이터와 일치하지 않으면 오류. ---> 테이블뷰 한 개의 row 삭제할 때, 데이터센터에 있는 데이터도 삭제해줘야한다. (먼저 데이터 지워주고, 해당 뷰가 삭제되며 해당 데이터 새로 고침) */
        
        [self.dataCenter removeFristSectionItemAtIndexes:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}


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

-(IBAction)clickInsertNewItemButton:(id)sender
{
//    /* 1번 섹션의 맨 밑에 데이터 추가하는 것*/
//    /* 새로 생길 데이터 인덱스는 기존에 있던 데이터 갯수 숫자와 같다(데이터는 0부터 시작되니) */
//    NSArray *secondData = [self.dataCenter dataForSection:1];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:secondData.count inSection:1];
//    [self.dataCenter insertNewItemInSecondSection];
//    
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    
//    NSLog(@"Click");

    self.tableView.editing = !self.tableView.editing;
}



@end
