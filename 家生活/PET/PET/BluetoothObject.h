//
//  BluetoothObject.h
//  PET
//
//  Created by liu_yakai on 16/9/5.
//  Copyright © 2016年 liu_yakai. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BluetoothObject : NSObject

+(BluetoothObject *)shar;

/**
 *  字符串替换
 *
 *  @param repleStr 要替换的字符串
 *  @param str      原始字符串
 *  @param repFish  替换成字符串
 *
 *  @return 返回字符串
 */
+(NSString *)reple:(NSString *)repleStr Str:(NSString *)str RepFish:(NSString *)repFish;
/**
 *  读取plish文件
 *
 *  @param name plis文件名
 *
 *  @return 返回plis对象为数组
 */
+(NSArray *)readPlish:(NSString *)name;

@end
