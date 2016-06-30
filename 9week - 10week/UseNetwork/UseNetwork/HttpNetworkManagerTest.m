//
//  HttpNetworkManagerTest.m
//  UseNetwork
//
//  Created by 배지영 on 2016. 6. 27..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HttpNetworkManager.h"

@interface HttpNetworkManagerTest : XCTestCase

@end

@implementation HttpNetworkManagerTest

- (void) testDownload {
    HttpNetworkManager *manager = [HttpNetworkManager new];
    [manager downloadTask];
}

@end
