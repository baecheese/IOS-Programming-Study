//
//  SecondTableViewController.m
//  TableViewExam
//
//  Created by 배지영 on 2016. 6. 15..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SecondTableViewController.h"
#import "TableViewController.h"
#import "ModalViewController.h"

@interface SecondTableViewController ()

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic) TableViewController *VC;

@end

@implementation SecondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *schoolArray = @[@"iOS", @"Android",@"Web front"];
    NSArray *campArray = @[@"iOS 입문", @"iOS 초급", @"iOS 중급"];
    
    self.datas = @[schoolArray, campArray];
    
    self.VC = [self.navigationController.viewControllers firstObject];
    
    /*
    [self addObserver:self forKeyPath:@"count" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
     */
    
    
}



//addObserver가 감시하는 객체가 변경이 되면 호출이 된다
// change - 어떤 것이 바뀐 것인지, 어떤 것이 예전값인지 딕셔너리로 들어옴.
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //NSLog(@"%@", change);
    
    // 컬렉션에는 참조형 객체만 들어갈 수 있다.
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSArray *newVlaue = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"kind: %@ , new : %@", kindValue, newVlaue);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 데이터 섹션 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// row(cell) 내의 데이터
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // 첫 번째 화면에서 select 가 0이면 selectCellIndex에 해당하는 데이터 뿌리기
    // 네비배열로 해서 가져오기
    
    if (self.VC.selectCellIndex == 0) {
        
        NSArray *schoolDatas = [self.datas objectAtIndex:self.VC.selectCellIndex];
        NSString *classInSchool = [schoolDatas objectAtIndex:indexPath.row];
        [cell.textLabel setText:classInSchool];
        
        return cell;
    }
    
    
    // 첫 번째 화면에서 selectCellIndex 가 1이면
    // camp에 해당하는 데이터 뿌리기
    else
    {
        NSArray *campDatas = [self.datas objectAtIndex:self.VC.selectCellIndex];
        NSString *classInCamp = [campDatas objectAtIndex:indexPath.row];
        [cell.textLabel setText:classInCamp];
        
        return cell;
    }
}

/* 클릭한 셀 인덱스 표시 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select : %ld - %ld", (long)indexPath.section, (long)indexPath.row);
    
    // 화면 객체 만들기
    // xib - nibName / stroyboad - instantiateViewControllerWithIdentifier
    if (indexPath.section == 0 && indexPath.row == 0) {
        ModalViewController *modalViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
        [self presentModalViewController:modalViewController animated:YES];
    }

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
