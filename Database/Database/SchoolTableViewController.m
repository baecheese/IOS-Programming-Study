//
//  SchoolTableViewController.m
//  Database
//
//  Created by 배지영 on 2016. 6. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "AppDelegate.h"
#import "School+CoreDataProperties.h"

@interface SchoolTableViewController ()

@property (nonatomic, weak) AppDelegate *appDelegate;
@property (nonatomic, weak) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray<School *> *schools;

@end

@implementation SchoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //앱의 싱글턴 델리게이트 호출
    // 시스템에서 만들어놓은 앱델리게이트 싱글턴을 가져옴
    // 싱글턴 앱의 자체의 델리게이트가 앱델리게이트?
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.appDelegate = appDelegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    /* 코어데이터에서 데이터를 가져오는 걸 폣치라고 함.
     어떤 자료를 담을 지 담을 곳 */
    
    // 요청서 작성
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    
    NSError *fetchError = nil;
    
    // 요청서 제출 - 관리 객체 컨텍스트에게
    // 관리 객체 컨텍스트가 데이터베이스에 있는 스쿨 관련 데이터를 array에 담는다.
    NSArray<School *> *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    NSLog(@"school array: %@, school error: %@", fetchResult, fetchError);
    
    if (fetchError != nil) {
        NSLog(@"Error occured %@", fetchError);
    }
    else {
        self.schools = [NSMutableArray arrayWithArray:fetchResult];
        NSLog(@"fetch success");
    }
    
    
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
    return self.schools.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolCell" forIndexPath:indexPath];
    
    // 스쿨 데이터 가져오기
    School *schoolInfo = [self.schools objectAtIndex:indexPath.row];
    cell.textLabel.text = schoolInfo.name;
    
    return cell;
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


-(IBAction)clickAddButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"School" message:@"추가할 school 이름 입력" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //첫번째 필드에 입력한 텍스트 추가
        
        UITextField *filed = alert.textFields.firstObject;
        NSString *inputText = filed.text;
        
        if ([inputText length] != 0) {
            NSLog(@"%@", inputText);
            
            // 텍스트를 테이블 row에 추가하는 메소드
            [self saveNewSchoolEntity:inputText];
            
        }
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:addAction];
    [alert addAction:cancelAction];
    
    // 얼럿에 사용자 입력을 받기 위해 텍스트 필드를 추가해 줄 수 있다
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // 블럭 내부에는 텍스트 필드의 폰트, 모양, 플레이스 홀더 등의 설정을 위한 코드를 넣어줄 수 있다
        [textField setPlaceholder:@"School 이름"];
    }];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)saveNewSchoolEntity:(NSString *)name {
    
    // 관리객체 컨텍스트가 새로운 entity에 해당되는 객체를 만들어 달라고 요청
    // 지금은 스쿨 객체 생성
    School *schoolToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"School" inManagedObjectContext:self.managedObjectContext];
    
    schoolToAdd.name = name;
    
    [self.appDelegate saveContext];
    
    [self.schools addObject:schoolToAdd];
    
    //reloadData - 테이블 전체 새로고침
    [self.tableView reloadData];
}

@end
