//
//  DataCenter.h
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 사운드 / 진동 */
typedef NS_ENUM(NSInteger, SettingRow)
{
    SettingRowSound = 0,
    SettingRowVibrate
};


@interface DataCenter : NSObject

+ (instancetype)defaultData;

-(NSInteger)numberOfSectionsForSettingTable;
-(NSArray *)settingTableDataForSection:(NSInteger)section;
-(NSInteger) numberOfRowForSectionInSettingTable:(NSInteger)section;
-(NSString *)settingTableHeaderTitleForSection:(NSInteger)section;

// 사용자 세팅 저장
-(void)setSeting:(SettingRow)function isOn:(BOOL)isOn;

// 불러오기
-(BOOL)isOnForSetting:(SettingRow)function;

@end
