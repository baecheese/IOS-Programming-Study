//
//  SettingTableViewCell.h
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>

// 스위치 값이 변경될 때 호출할 메서드
// 특정할 셀이 자신이 스위치 변경되었다고 말한다.
-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISwitch *settingSwitch;

@property(nonatomic, weak) id<SettingTableViewCellDelegate> delegate;


@end
