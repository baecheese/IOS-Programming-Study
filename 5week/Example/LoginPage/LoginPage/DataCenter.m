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

-(NSMutableDictionary *)selectDataByKey:(NSString *) dataKey fileName:(NSString *) fileName
{
    NSMutableDictionary *datas = [self readDataFile:fileName];
    return [datas valueForKey:dataKey];
}

-(NSArray<NSMutableDictionary *> *)selectDatasByKeys:(NSString *) fileName dataKeys:(NSArray *) dataKeys
{
    NSMutableArray *dataArray = [NSMutableArray new];
    
    for(NSString *dataKey in dataKeys) {
        [dataArray addObject:[self selectDataByKey:dataKey fileName:fileName]];
    }
    return dataArray;
}

-(NSMutableDictionary *)readDataFile:(NSString *) fileName
{
    /* 파일 위치 불러오기 - 주소 불러오기 */
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [path objectAtIndex:0];
    NSString *realFileName = [NSString stringWithFormat:@"%@.plist", fileName];
    NSString *docuPath = [basePath stringByAppendingPathComponent:realFileName];
    
    /* 파일 불러오기 */
    return [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
}

-(void)addData:(NSDictionary *)data dataKey:(NSString *)dataKey fileName:(NSString *)fileName
{
    /* 파일 위치 불러오기 - 주소 불러오기 */
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [path objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    /* Doucument folder에 파일이 있는지 확인하고, Bundle에 있는 파일 Document에 복사 */
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if (![fileManger fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        [fileManger copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    /* 파일 불러오기 - 딕셔너리 만들기 - 추가 - 다시 파일로 변환*/
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionaryWithContentsOfFile:docuPath];
    [dataDict setObject:data forKey:dataKey];
    [dataDict writeToFile:docuPath atomically:NO];
}

@end
