//
//  CustomTableViewCell.m
//  TableViewExam
//
//  Created by 배지영 on 2016. 6. 16..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.settingSwitch = [[UISwitch alloc] init];
    self.accessoryView = self.settingSwitch;
    [self.settingSwitch addTarget:self action:@selector(swichValueChanged:) forControlEvents:UIControlEventValueChanged];
    return self;
}

-(void)swichValueChanged:(UISwitch *)sender
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    
}

@end
