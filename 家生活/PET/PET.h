//
//  PET.h
//  PET
//
//  Created by liu_yakai on 16/8/31.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#ifndef PET_h
#define PET_h
#import <CoreBluetooth/CoreBluetooth.h>
#import "AppDelegate.h"

#define KeyApp (AppDelegate *) [[UIApplication sharedApplication]delegate]
//获取屏幕的宽度和高度
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
//rgba值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//imageView set图片名字
#define OdeSetImageName(OdeimageName) [UIImage imageNamed:OdeimageName]

//主机地址
#define SERVER_URL @"http://202.104.132.71:8088/"

#endif /* PET_h */
