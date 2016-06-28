//
//  TableViewController.m
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "TableViewController.h"
#import "ImageViewController.h"
#import "RequstObject.h"

@interface TableViewController ()<UIImagePickerControllerDelegate>

@property (nonatomic, strong) NSArray* imageInfos;

@property (nonatomic) NSInteger countsUploadCount;

// table에 올릴 데이터 array
@property (nonatomic, strong) NSMutableArray *datas;
// 이미지는 외부 프로퍼티

// 다음 장에서 받을 이미지
@property (weak, nonatomic) UIImage *imageView;
@property (strong, nonatomic) UIImage *selectedImage;
@end

@implementation TableViewController

-(void)viewDidAppear:(BOOL)animated {
    
    if (self.countsUploadCount == 1) {
        NSLog(@"사진 업로드");
    }
    else {
        [self addAlertWithTextField:@"id" message:@"id를 입력해주세요" setPlaceholder:@"100~120까지" useProperty:NO];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ⭐️ 초기화
    NSMutableArray *datas = [[NSMutableArray alloc]initWithCapacity:1];
    NSMutableArray<UIImage *> *imageDats = [[NSMutableArray alloc] initWithCapacity:1];
    self.datas = datas;
    self.imageDatas = imageDats;
    
    // notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTable) name:ImageListUpdataNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestImageList) name:ImageUploadDidSuccessNotification object:nil];
    
    
    
}



- (IBAction)refreshBarButton:(id)sender {
    //reloadData - 테이블 전체 새로고침
    [self.tableView reloadData];
    NSLog(@"테이블뷰 재 로딩");
    
}

- (IBAction)addBarButton:(id)sender {
    
    self.countsUploadCount = 1;
    NSLog(@"count %ld", (long)self.countsUploadCount);
    
    // filker 화면
    [self showImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
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
    // 데이터 갯수
    //return self.imageDatas.count;
    
    // 데이터 갯수
    return self.imageInfos.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *imageInfo = self.imageInfos[indexPath.row];
    NSString *imageTitle = imageInfo[JSONKeyImageTitle];
    
    cell.textLabel.text = imageTitle;
    
    NSString *thumbnailURLString = imageInfo[JSONKeyThumbnailURL];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    // URL Array 프로퍼티에 서버에서 내려받은 이미지 URL 넣기
    [self.imageURLArray addObject:thumbnailURL];
    
    // 썸네일
    UIImage *cellImage = [UIImage imageNamed:@"placeholder"];
    
    cell.imageView.image = cellImage;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 실제 이미지가 섬네일일 때
    //cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    
    /*
    // 서버에서 받은 것받은 것 위에 세팅 ---- todo
    [self.imageDatas addObject:cellImage];
    [self.datas addObject:imageTitle];
     */
    
    // dataTaskWithURL -> 이미지 다운로드하는 스레드를 만들어줌
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            UIImage *image = [UIImage imageWithData:data];
            if (image != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                    cellForUpdate.imageView.image = image;
                    
                });
            }
        }
    }];
    
    [task resume];
    
    return cell;
}


// 셀 클릭 했을 때 옆 화면으로 가면서 해당 배열에 대항하는 셀 정보 다음 칸에서 받기 -> 프로퍼티로 해당 정보 세팅해놓기 --  todo
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectRowIndex = indexPath.row;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     
     return YES;
 }


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.datas removeObjectAtIndex:indexPath.row];
        [self.imageDatas removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}



#pragma mark - Custom tableView

-(void)refreshTable {
    // ⭐️ 스레드 관련 한 번 더 보고 이해해보기
    self.imageInfos = [[RequstObject shareInstance] imageInforJSONArray];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    });
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


/* 사진 앨범 접근 */

-(void)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    /* 소스타입 사용 가능한 상황인지 ex 시뮬레이터는 카메라 안됨 */
    if ([UIImagePickerController isSourceTypeAvailable:sourceType] == NO)
    {
        // 사용자에겐 allert 띄워주기
        NSLog(@"이 소스는 못쓰낟");
    }
    else
    {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
        
        [pickerController setSourceType:sourceType];
        [pickerController setDelegate:self];
        
        // picker를 통한 이미지 수정 허용
        pickerController.allowsEditing = YES;
        
        //picker를 모달로 보여준다.
        [self presentViewController:pickerController animated:YES completion:nil];
        
    }
}


#pragma mark - UIImagePicker Controller Delegate

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //picker를 모달로 내려준다.
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 수정할 이미지는 새로 키를 변경
    UIImage *pickerEiditedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // 선택 이미지 프로퍼티 데이터에 넣기
    [self.imageDatas addObject: pickerEiditedImage];
    self.selectedImage = pickerEiditedImage;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self addAlertWithTextField:@"사진 업로드" message:@"사진 제목을 입력하세요" setPlaceholder:@"사진 제목" useProperty:YES];
    }];
}


#pragma mark - Custom Method

// 다음 화면으로 ㄱ
-(void)moveNextViewController:(NSString *)stroyboardIdentifier {
    UIStoryboard *storyboard = self.storyboard;
    ImageViewController *svc = [storyboard instantiateViewControllerWithIdentifier:stroyboardIdentifier];
    [self presentViewController:svc animated:YES completion:nil];
}


-(void)requestImageList {
    [[RequstObject shareInstance] requestImageList];
}

// alert
-(void)addAlertWithTextField:(NSString *)title message:(NSString *) message setPlaceholder:(NSString *)placeholder useProperty:(BOOL)useProperty {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (1 > alert.textFields.firstObject.text.length) {
            // 입력값이 없을 때
            [self showWarningAboutNullTextToAlert:^(UIAlertAction *action) {
                // 다시 적으라고 하기
                [self addAlertWithTextField:title message:message setPlaceholder:placeholder useProperty:useProperty];// ----todo --> 텍스트를 테이블로 옮겨야함. 사진명을 옮기려면 리로드해야할듯?
            }];
        }
        else {
            UITextField *textField = alert.textFields.firstObject;
            NSString *inputText = textField.text;
            NSString *rowData = textField.text;
            
            // login (property 사용 여부로 볼 것이 아닐 듯) ---- code리펙토링 요망
            if (useProperty == NO) {
                [[RequstObject shareInstance] setUserID:inputText];
                self.navigationItem.title = alert.textFields.firstObject.text;
                [self requestImageList];
            }
            else {
                // 전해질 객체 배열에 넣기
                [self.datas addObject:rowData];
                [self.tableView reloadData];
                [[RequstObject shareInstance] uploadImage:self.selectedImage
                                                    title:inputText];
            }
        }
    }];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okButton];
    [alert addAction:cancelButton];
    
    // alert 내에 텍스트필드 추가
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:placeholder];
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

// null text 경고창
// handler로 경고창 후에 띄울 창 input
-(void)showWarningAboutNullTextToAlert:(void (^ __nullable)(UIAlertAction *action))handler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"경고" message:@"올바른 입력값을 넣어주세요!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:handler];
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];

}




@end
