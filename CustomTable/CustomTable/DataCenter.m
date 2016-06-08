//
//  DataCenter.m
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "DataCenter.h"

static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const keyVibrateSetting = @"UserVibrateIsOn";

@interface DataCenter()

@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic,strong) NSArray *weatherData;
@property (nonatomic, strong) NSArray *settingHeaderTitle;

@end

@implementation DataCenter

+ (instancetype)defaultData
{
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.settingTableData = @[@[@"사운드", @"진동"],@[@"세계날씨", @"한국날씨"]];
        dataCenter.settingHeaderTitle = @[@"설정", @"날씨"];
    });
    
    return dataCenter;
}

-(NSInteger)numberOfSectionsForSettingTable
{
    return 2;
}

-(NSArray *)settingTableDataForSection:(NSInteger)section
{
    return (NSArray *)self.settingTableData[section];
}

-(NSInteger) numberOfRowForSectionInSettingTable:(NSInteger)section
{
    return [[self settingTableDataForSection:section] count];
}

-(NSString *)settingTableHeaderTitleForSection:(NSInteger)section
{
    return (NSString *)self.settingHeaderTitle[section];
}

// 사용자 세팅 저장
-(void)setSeting:(SettingRow)function isOn:(BOOL)isOn
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *key = nil;
    if (function == SettingRowSound)
    {
        key = keySoundSetting;
    }
    else
    {
        key = keyVibrateSetting;
    }
    [userDefault setBool:isOn forKey:key];
    [userDefault synchronize];
}

// 불러오기
-(BOOL)isOnForSetting:(SettingRow)function
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    
    if (function == SettingRowSound)
    {
        key = keySoundSetting;
    }
    else
    {
        key = keyVibrateSetting;
    }
    
    return [userDefault boolForKey:key];
}

@end
