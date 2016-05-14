//
//  CustomButton.h
//  VendingMachine
//
//  Created by 배지영 on 2016. 5. 13..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomButtonDelegate;
@interface CustomButton : UIView;

@property (nonatomic, nullable) id <CustomButtonDelegate> delegate;

-(void) creatView;
-(void)updateLayout;

-(void)setTite:(nullable NSString *)title;
-(void)setImageWithName:(nullable NSString *)imageName;

@end

@protocol CustomButtonDelegate <NSObject>

-(void)didSelecteWithCustonButton:(nullable CustomButton *)customBtn;

@end