//
//  RequstObject.h
//  NetworkProject
//
//  Created by 배지영 on 2016. 6. 24..
//  Copyright © 2016년 baecheese. All rights reserved.
//

#import <UIKit/UIKit.h>

/* Notification */

static NSString *ImageListUpdataNotification = @"ImageListUpdataed";
static NSString *ImageListFailNotification = @"ImageListFail";
static NSString *ImageUploadDidSuccessNotification = @"ImageUploadDidSuccess";
static NSString *ImageUploadFailNotification = @"ImageUploadFail";

static NSString *JSONKeyImageURL = @"image_url";
static NSString *JSONKeyThumbnailURL = @"thumbnail_url";
static NSString *JSONKeyImageTitle = @"title";


@interface RequstObject : NSObject

@property (nonatomic, strong) NSArray *imageInforJSONArray;
@property (nonatomic, strong) NSString *userID;

+(instancetype)shareInstance;
-(void)uploadImage:(UIImage *)image title:(NSString *)title;
-(void)requestImageList;

@end
