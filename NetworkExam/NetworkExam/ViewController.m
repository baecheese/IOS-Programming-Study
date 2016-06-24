//
//  ViewController.m
//  NetworkExam
//
//  Created by 배지영 on 2016. 6. 23..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 링크를 바로 적용시키는 것
    // session 객체 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // task 객체 생성
    //이미지주소(스트링)을 url로 바꾸자
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data.length > 0) {
            // 이미지 객체 만들기
            UIImage *image = [UIImage imageWithData:data];
            // 블럭은 다른 스레드이기 때문에 GCD로
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        };
    }];
     */
    
    
    /* 비동기 방식 */
    // 리퀘스트 방식. 위에 꺼는 사실 url을 통한 get방식이나 마찬가지인 것.
    // 보통은 아래 방식으로 하면 이 안(해더, 바디)에 일정한 정보를 넣어 서버에 보낸다.
    
    // session 객체 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // task 객체 생성
    //이미지주소(스트링)을 url로 바꾸자
    NSURL *url = [NSURL URLWithString:@"https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg"];
    NSMutableURLRequest *requset = [NSMutableURLRequest requestWithURL:url];
    requset.HTTPMethod = @"GET";
    
    // 비동기 (viewDidLoad 전에 뜸) - 대부분이 비동기를 사용
    // 사용자에게 비동기로 오류 메세지/인디케이터를 띄워줘야 할 것 (오류 메세지를 동기로 하면 오류 시 보이지 않을 테니)
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requset completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data.length > 0) {
            // 이미지 객체 만들기
            UIImage *image = [UIImage imageWithData:data];
            // 블럭은 다른 스레드이기 때문에 GCD로
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        };
    }];
    [dataTask resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
