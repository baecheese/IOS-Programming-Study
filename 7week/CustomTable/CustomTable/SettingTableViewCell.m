//
//  SettingViewCell.m
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)swichValueChanged:(UISwitch *)sender
{
    NSLog(@"Switch %d", sender.isOn);
    [self.delegate settingTableViewCellSwitchValueChanged:self isOn:sender.isOn];
}


/* 뷰가 그려질 때마다 호출되는 메소드 */
- (void)drawRect:(CGRect)rect
{
    if (self.settingSwitch == nil)
    {
        // 아래로 내림. 그려지기 전에 정보를 세팅해주면 시점이 맞지 않는다.
        // 셀과 스위치 만드는 뷰를 동시에 init
        // 스위치 올린 후, 저장
    }
}

// initWithStyle를 override해줌
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.settingSwitch = [[UISwitch alloc] init];
    self.accessoryView = self.settingSwitch;
    [self.settingSwitch addTarget:self action:@selector(swichValueChanged:) forControlEvents:UIControlEventValueChanged];
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
