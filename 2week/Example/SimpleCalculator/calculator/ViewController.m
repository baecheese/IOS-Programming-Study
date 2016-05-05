//
//  ViewController.m
//  calculator
//
//  Created by 배지영 on 2016. 5. 4..
//  Copyright © 2016년 me. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //데이터초기화
    [self initData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/***************************************
 시크릿 메소드
 ****************************************/

//데이터 초기화
- (void) initData
{
    resultNum = 0;
    operatorBuffer = @"";
    displayText = @"";
}



/***************************************
 산술연산
****************************************/

//더하기 연산
-(void)operationAdd:(NSInteger)secondNum
{
    resultNum = resultNum + secondNum;
}

//빼기 연산
-(void)operationSub:(NSInteger)secondNum
{
    resultNum = resultNum - secondNum;
}

//곱하기 연산
-(void)operationMulti:(NSInteger)secondNum
{
    resultNum = resultNum * secondNum;
}

//나누기 연산
-(void)operationDividing:(NSInteger)secondNum
{
    resultNum = resultNum / secondNum;
}

//operatingWithSecondNum
-(void)operatingWithSecondNum:(NSInteger)num
{
    if(operatorBuffer.length != 0)
    {
        [self operationAdd:num];
    }
    else if(operatorBuffer.length != 0)
    {
        [self operationSub:num];
    }
    else if(operatorBuffer.length != 0)
    {
        [self operationMulti:num];
    }
    else if(operatorBuffer.length != 0)
    {
        [self operationDividing:num];
    }
    else
    {
        NSLog(@"error");
    }
}


/***************************************
 버튼 액션
****************************************/


- (IBAction)onTouchupsideNumberBtn:(id)sender
{
    //sender 캐스팅 : id 타입 -> UIButton
    NSString *numberStr = ((UIButton *)sender).titleLabel.text;
    displayText = [displayText stringByAppendingString:numberStr];
    
    [self.displayTextField setText:displayText];
    
    printf("NumberBtn클릭\n");
    printf("%d\n", resultNum);
}

- (IBAction)onTouchupsideOperationBtn:(UIButton *)sender
{

    //처음에는 숫자가 들어가야 한다.
    if (displayText.length > 0)
    {
        //기존에 display 에 있는 숫자를 결과에 추가한다.
        [self operatingWithSecondNum:displayText.integerValue];
        
        //result결과값을 텍스트로 변경해서 표시
        [self.displayTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
        //displaytext 지워준다
        displayText = @"";
        //오퍼레이션을 버퍼에 넣는다
        operatorBuffer = sender.titleLabel.text;
        
    }
    
    else
    {
        if (operatorBuffer.length != 0) {
            operatorBuffer = sender.titleLabel.text;
        }
    }

}


- (IBAction)onTouchupsideResultBtn:(id)sender
{    
    if (displayText.length>0)
    {
        // 기존 화면
        [self operatingWithSecondNum:displayText.integerValue];
        
        [self.displayTextField setText:[NSString stringWithFormat:@"%zd", resultNum]];
    }
}



- (IBAction)onTouchupsideCancelBtn:(id)sender
{
    //데이터초기화
    [self initData];
}


@end
