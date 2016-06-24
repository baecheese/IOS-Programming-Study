//
//  RequstObject.m
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 24..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "RequstObject.h"

@implementation RequstObject

+(instancetype)shareInstance {
    static RequstObject *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[RequstObject alloc]init];
    });
    
    return object;
}

/* mutipart */
-(void)uploadImage:(UIImage *)image title:(NSString *)title {
    
    NSLog(@"upload image %@", title);
    
//    /* mutipart의 boundary String 설정
//     -> 이는 추후 requst 패킷 안에 넣어줄 것 */
//    NSString *boundary = @"------------boundary---";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
//    
//    
//    /* base url에 + 업로드 파일 경로 -> 그 url로 request url 생성*/
//    NSString *imageUploadURLString = @"http://ios.yevgnenll.me/api/images/";
//    NSURL *requestURL = [NSURL URLWithString:imageUploadURLString];
//    
//    
//    /* URLRquest로 요청서 작성 (어떤 contents 타입 원하는지 설정) */
//    // creat request
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
//    [request setHTTPMethod:@"POST"];
//    [request setURL:requestURL];
//    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
//    
//    
//    /* 실질적인 Body 작성
//     boundary String을 Data형식으로 바꿔서 첫 줄에 붙여주는 것으로 시작
//     boundary - userID - boundary - imageTitle - boundary - imageData(imageFileName 포함) - finishBoundary  */
//    
//    NSData *boundaryData = [[NSString stringWithFormat:@"---%@\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableData *body = [NSMutableData data];
//    
//    [body appendData:boundaryData];
//    
//    NSData *userIDKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\n\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *userIDData = [[NSString stringWithFormat:@"%@\n", self.userID] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    
//    [body appendData:userIDKeyData];
//    [body appendData:userIDData];
//    
//    [body appendData:boundaryData];
//    
//    NSData *imageTitleKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\n\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *imageTitleData = [[NSString stringWithFormat:@"%@\n", title] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [body appendData:imageTitleKeyData];
//    [body appendData:imageTitleData];
//    
//    [body appendData:boundaryData];
//    
//    NSData *imageDataKeyData =[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image_file.jpeg\"\n\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    /* 이미지를 NSData형식으로 바꿈 (뒤에 숫자는 압축 비율. 0.1 = 원본 이미지의 10%로 보내달라.)*/
//    /* jpeg로 바꿨으니 나중에 쓸 때도 jpeg로 */
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
//    
//    [body appendData:imageDataKeyData];
//    [body appendData:imageData];
//    
//    NSData *finishBoundaryData = [[NSString stringWithFormat:@"---%@----\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
//    [body appendData:finishBoundaryData];
//    
//    [request setHTTPBody:body];
    
    
    
    ///
//
//    
//    /* for 문으로 바꿈 */
//    NSString *boundary = @"------------boundary---";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
//    
//    NSString *imageUploadURLString = @"http://ios.yevgnenll.me/api/images/";
//    NSURL *requestURL = [NSURL URLWithString:imageUploadURLString];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
//    [request setHTTPMethod:@"POST"];
//    [request setURL:requestURL];
//    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
//    
//    NSMutableData *body = [NSMutableData data];
//    
//    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
//    [bodyParams setObject:self.userID forKey:@"user_id"];
//    [bodyParams setObject:title forKey:@"title"];
//    
//    NSData *boundaryData = [[NSString stringWithFormat:@"\n---%@\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    for (NSString *key in bodyParams) {
//        [body appendData:boundaryData];
//        
//        NSData *valueKeyDate = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", key] dataUsingEncoding:NSUTF8StringEncoding];
//        [body appendData:valueKeyDate];
//        
//        NSString *value = bodyParams[key];
//        NSData *valueData = [[NSString stringWithFormat:@"%@\n", value] dataUsingEncoding:NSUTF8StringEncoding];
//        [body appendData:valueData];
//        
//    }
//    
//    [body appendData:boundaryData];
//    
//    NSData *imageKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\n"] dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [body appendData:imageKeyData];
//    
//    NSData *imageContentTypeDatas = [@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding];
//    [body appendData:imageContentTypeDatas];
//    
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
//    [body appendData:imageData];
//    
//    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\n---%@----\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
//    [body appendData:finishBoundaryData];
//    
//    [request setHTTPBody:body];
//    
//    
//    /* ------------------------------------------- */
//    
//    // 웹에 접속하려고 할 때, session객체를 통해서 접근 가능 = 네트워크 통신을 할 수 있도록 도와줌.
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    /* 요청서 */
//    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if (error != nil) {
//            NSLog(@"Error occred: %@", error);
//            return;
//        }
//        
//        if (data == nil) {
//            NSLog(@"Data dosen't exist");
//            return;
//        }
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@", dict);
//        
//    }];
//    
//    // 실질적 업로드 작업 start
//    [uploadTask resume];

    
    NSString *boundary = @"-----------------yagom";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    
    NSString *imageUploadURLString = @"http://ios.yevgnenll.me/api/images/";
    NSURL *requestURL = [NSURL URLWithString:imageUploadURLString];
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:requestURL];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSMutableDictionary *bodyParams = [[NSMutableDictionary alloc] init];
    [bodyParams setObject:self.userID forKey:@"user_id"];
    [bodyParams setObject:title forKey:@"title"];;
    
    NSData *boundaryData = [[NSString stringWithFormat:@"\n--%@\n", boundary] dataUsingEncoding:NSUTF8StringEncoding];
    
    for (NSString *key in bodyParams) {
        
        [body appendData:boundaryData];
        
        NSData *valueKeyData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\n\n", key] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueKeyData];
        
        NSString *value = bodyParams[key];
        NSData *valueData = [[NSString stringWithFormat:@"%@\n", value] dataUsingEncoding:NSUTF8StringEncoding];
        [body appendData:valueData];
    }
    
    [body appendData:boundaryData];
    
    NSData *imageKeyData = [[NSString stringWithString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\n"]] dataUsingEncoding:NSUTF8StringEncoding];
    
    [body appendData:imageKeyData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\n\n" dataUsingEncoding:NSUTF8StringEncoding];
    
    [body appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [body appendData:[NSData dataWithData:imageData]];
    
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\n--%@--\n",boundary] dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:finishBoundaryData];
    [request setHTTPBody:body];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                               fromData:nil
                                                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                          
                                                          if (error != nil) {
                                                              NSLog(@"Error occured : %@", error);
                                                              return;
                                                          }
                                                          
                                                          if (data == nil) {
                                                              NSLog(@"Data dosen't exist");
                                                              return;
                                                          }
                                                          
                                                          NSLog(@"%@", response);
                                                          
                                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                               options:NSJSONReadingMutableLeaves
                                                                                                                 error:nil];
                                                          NSLog(@"%@",dict);
                                                      }];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [uploadTask resume];
    
    
    
    
    
}

@end
