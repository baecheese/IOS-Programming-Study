//
//  DataCenter.m
//  TableEditing
//
//  Created by 배지영 on 2016. 6. 9..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter ()

@property (nonatomic, strong) NSMutableArray *fristSectionData;
@property (nonatomic, strong) NSMutableArray *secondSectionData;

@end

@implementation DataCenter

+(instancetype)defaultData
{
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc]init];
        dataCenter.fristSectionData = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C", nil];
        dataCenter.secondSectionData = [[NSMutableArray alloc]initWithObjects:@"D",@"E",@"F", nil];
    });
    
    return dataCenter;
}

-(NSMutableArray *)dataForSection:(NSUInteger)section
{
    if (section == 0) {
        return _fristSectionData;
    }
    else
    {
        return _secondSectionData;
    }
}

/* 데이터 추가 */
-(void)insertNewItemInSecondSection
{
    [self.secondSectionData addObject:@"NewData"];
}

/* 데이터 삭제 */
-(void) removeFristSectionItemAtIndexes:(NSInteger)index
{
    [self.fristSectionData removeObjectAtIndex:index];
}

@end
