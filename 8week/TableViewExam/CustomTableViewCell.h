//
//  CustomTableViewCell.h
//  TableViewExam
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

// Custom Delegate 설정
@protocol SettingTableViewCellDelegate <NSObject>

-(void)settingTableViewCellSwitchValueChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UISwitch *settingSwitch;
@property(nonatomic, weak) id<SettingTableViewCellDelegate> delegate;

@end
