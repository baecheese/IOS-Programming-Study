//
//  WeatherTableViewController.h
//  CustomTable
//
//  Created by 배지영 on 2016. 6. 8..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeatherType)
{
    WeatherTypeKorea = 0,
    WeatherTypeWorld
};

@interface WeatherTableViewController : UITableViewController

// 어느 나라 날씨 불러올지 설정이 됨
@property (nonatomic) WeatherType weatherType;

@end
