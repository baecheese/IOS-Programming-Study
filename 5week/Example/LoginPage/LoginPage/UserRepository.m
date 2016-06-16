//
//  UserRepository.m
//  LoginPage
//
//  Created by 배지영 on 2016. 6. 6..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "UserRepository.h"
#import "DataCenter.h"
#import "User.h"

@interface UserRepository ()

@property (nonatomic, weak) NSString *dataFileName;
@property (nonatomic, weak) DataCenter *datas;

@end

@implementation UserRepository

/* dataFileName 및 데이터센터 인스턴스 세팅 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataFileName = @"userList";
        self.datas = [DataCenter sharedInstance];
    }
    return self;
}


/* 데이터 센터에서 유저 찾아옴 */
- (User *) findByUserId:(NSString *)userId
{
    //유저 아이디와 맞는 데이터 찾아오기
    NSMutableDictionary *data = [_datas selectDataByKey:userId fileName:_dataFileName];
    return [self dictionaryToUser:data];
}

- (NSArray<User *> *) findAllByUserIds:(NSArray *) userIds
{
    NSArray<NSMutableDictionary *> *datas = [_datas selectDatasByKeys:_dataFileName dataKeys:userIds];
    
    NSMutableArray<User *> *resultArray = [NSMutableArray new];
    for (NSMutableDictionary *dict in datas) {
        [resultArray addObject:[self dictionaryToUser:dict]];
    }
    return resultArray;
}

/* 데이터 센터에 저장 */
-(void) save:(User *) user
{
    NSDictionary *userDic = [self userToDictionary:user];
    [_datas addData: userDic dataKey:user.userID fileName:_dataFileName];
}

-(NSDictionary *) userToDictionary:(User *)user
{
    NSMutableDictionary *userDic = [[NSMutableDictionary alloc]init];
    [userDic setObject:user.userID forKey:@"userID"];
    [userDic setObject:user.userPW forKey:@"userPW"];
    return userDic;
}

- (User *) dictionaryToUser:(NSMutableDictionary *)data
{
    if (data == nil)
    {
        NSLog(@"없는 회원이다.");
        return nil;
    }
    
    NSString *userId = [data objectForKey:@"userID"];
    NSString *userPw = [data objectForKey:@"userPW"];
    User *user = [[User alloc]initWithUser:userId userPW:userPw];
    return user;
}

@end
