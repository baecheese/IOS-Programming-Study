//
//  CustomButton.m
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton()

@property (nonatomic, weak) UIImageView *drinkImg;
@property (nonatomic, weak) UILabel *titleLB;
@property (nonatomic, weak) UIButton *actionBtn;

@end


@implementation CustomButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void) creatView
{
    UIImageView *dirnkImg =[[UIImageView alloc]init];
    [self addSubview: dirnkImg];
    self.drinkImg = dirnkImg;
    
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.textColor = [UIColor blackColor];
    titleLB.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleLB];
    self.titleLB = titleLB;
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn addTarget:self action:@selector(onTouchInsideActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionBtn];
    self.actionBtn = actionBtn;
}

-(void)updateLayout
{
    [self.drinkImg setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height -22)];
    [self.titleLB setFrame:CGRectMake(0, self.frame.size.height - 22, self.frame.size.width, 22)];
    [self.actionBtn setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

-(void)setTite:(NSString *)title
{
    [self.titleLB setText:title];
}

-(void)setImageWithName:(NSString *)imageName
{
    [self.drinkImg setImage:[UIImage imageNamed:imageName]];
}

-(void)onTouchInsideActionBtn:(UIButton *)sender
{
    if([self.delegate respondsToSelector:@selector(didSelecteWithCustonButton:)])
    {
        [self.delegate didSelecteWithCustonButton:self];
    }
}

@end
