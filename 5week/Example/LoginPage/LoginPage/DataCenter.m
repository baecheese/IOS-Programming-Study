//
//  DataCenter.m
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 3..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

#pragma mark - DataCenter singleton

+ (instancetype)sharedInstance
{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc]init];
    });
    
    return dataCenter;
}

-(NSMutableDictionary *)findByUserId:(NSString *)userID
{
    NSMutableDictionary *datas = [self callUserInformation];
    return [datas valueForKey:userID];
}


-(NSMutableDictionary *)callUserInformation
{
    /* 파일 위치 불러오기 - 주소 불러오기 */
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [path objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"userList.plist"];
    
    /* 파일 불러오기 */
    NSMutableDictionary *userList = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    
    return userList;
}

-(void)addUserInformation:(NSString *)userID userPW:(NSString *)userPW
{
    /* 파일 위치 불러오기 - 주소 불러오기 */
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [path objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"userList.plist"];
    
    /* Doucument folder에 파일이 있는지 확인하고, Bundle에 있는 파일 Document에 복사 */
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if (![fileManger fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"userList" ofType:@"plist"];
        [fileManger copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    /* 파일 불러오기 - 딕셔너리 만들기 - 추가 - 다시 파일로 변환*/
    NSMutableDictionary *userList = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    NSDictionary *newUser = @{@"ID":userID, @"PW": userPW};
    [userList setObject:newUser forKey:userID];
    [userList writeToFile:docuPath atomically:NO];
}

@end
