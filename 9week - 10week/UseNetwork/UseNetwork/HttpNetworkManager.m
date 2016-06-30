//
//  HttpNetworkManager.m
//  UseNetwork
//
//  Created by 배지영 on 2016. 6. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "HttpNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation HttpNetworkManager

- (void) downloadTask {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://www.naver.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
        }
    }];
    [dataTask resume];
}

@end
