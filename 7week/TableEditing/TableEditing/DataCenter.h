//
//  DataCenter.h
//  TableEditing
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataCenter : NSObject

+(instancetype)defaultData;

-(NSMutableArray *)dataForSection:(NSUInteger)section;

/* 데이터 추가 */
-(void)insertNewItemInSecondSection;

/* 데이터 삭제 */
-(void) removeFristSectionItemAtIndexes:(NSInteger)index;

@end
