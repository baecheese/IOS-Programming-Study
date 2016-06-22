//
//  TableViewController.h
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 22..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic) NSInteger selectRowIndex;
@property (nonatomic, strong) NSMutableArray<UIImage *> *imageDatas;

@end
